class Collection {
  constructor(attributes) {
    this.id = attributes.id;
    this.manga = {id: attributes.manga.id, title: attributes.manga.title};
    this.review = attributes.review;
    this.rating = attributes.rating;
    this.status = attributes.status;
    this.last_read = attributes.last_read;
  };

  renderHtml(source) {
    const templateSource = $(source).html();
    const template = Handlebars.compile(templateSource);
    return template(this);
  };
};

class Form {
  constructor(form) {
    this.path = form.attr('action');
    this.params = form.serialize();
    this.method = form.children('input[name=_method]').attr('value') || 'post';
  };

  sendAjaxRequest() {
    return $.ajax({
      method: this.method,
      url: this.path,
      data: this.params,
      dataType: 'json'
    });
  };
};

Collection.changeAddButton = (collection) => {
  const $button = $(`#${collection.manga.id}-button`);
  const button = '<button class="btn btn-default">In Collection</button>';
  $button.html(button);
};

$(document).on('turbolinks:load', () => {

  $('tr').on('change', '.changeReading',  function(e) {
    let form = new Form($(this).parent());
    form.sendAjaxRequest()
  });

  $('.changeStatus').on('change', function(e) {
    let form = new Form($(this).parent());
    form.sendAjaxRequest().success(function(json) {
      let collection = new Collection(json);
      const $reading = $(`#row-${collection.id}`).find('.reading');
      if (collection.status == "Reading") {
        const html = collection.renderHtml("#reading-template");
        $reading.html(html);
      } else {
        $reading.html("");
      };
    });
  });

  $('.deleteCollection').on('submit', function(e) {
    e.preventDefault();
    let form = new Form($(this));
    form.sendAjaxRequest().success(function(json) {
      let collection = new Collection(json);
      $(`tr#row-${collection.id}`).remove();
    });
  });

  $('.addToCollection').on('submit', function(e) {
    e.preventDefault();
    let form = new Form($(this));
    form.sendAjaxRequest().success(function(json) {
      let collection = new Collection(json);
      Collection.changeAddButton(collection);
    });
  });

  $('form#reviewForm').on('submit', function(e) {
    e.preventDefault();
    let form = new Form($(this));
    form.sendAjaxRequest().success(function(json) {
      let collection = new Collection(json);
      const $review = $(`#${collection.id}-review`);
      const $rating = $(`#${collection.id}-rating`);

      if ($review.length == 0 && $rating.length == 0) {
        const html = collection.renderHtml("#review-template");
        $('#reviews').append(html);
        Collection.changeAddButton(collection);
      } else {
        $review.text(collection.review);
        $rating.text(collection.rating);
      };
    })
    .error(function(resp) {
      console.log("Mayday, mayday", resp);
    });
  });

  $('#js-show-reviews').on('click', function(e) {
    e.preventDefault();
    const id = $(this).data('id');
    $('#reviews').html("");
    $.get(`/users/${id}/collections`, (collections) => {
      collections.forEach(json => {
        if (json.review != null) {
          let collection = new Collection(json);
          const html = collection.renderHtml("#review-template");
          $('#reviews').append(html);
        };
      });
    }, 'json');
  });
});

function sendAjaxRequest(method, path, params) {
  return $.ajax({
    method: method,
    url: path,
    data: params,
    dataType: 'json'
  });
};
