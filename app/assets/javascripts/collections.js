class Collection {
  constructor(attributes) {
    this.id = attributes.id;
    this.manga_id = attributes.manga.id;
    this.review = attributes.review;
    this.rating = attributes.rating;
    this.status = attributes.status;
    this.last_read = attributes.last_read;
  };

  templateSource() {
    return $("#review-template").html();
  }

  renderReview() {
    const template = Handlebars.compile(this.templateSource());
    return template(this);
  };
};

Collection.changeAddButton = (collection) => {
  const $button = $(`#${collection.manga_id}-button`);
  const button = '<button class="btn btn-default">In Collection</button>';
  $button.html(button);
};

$(document).on('turbolinks:load', () => {
  $('tr').on('change', '.changeReading',  function(e) {
    const $form = $(this).parent();
    const path = $form.attr('action');
    const params = $form.serialize();
    sendAjaxRequest('patch', path, params)
  });

  $('.changeStatus').on('change', function(e) {
    const $form = $(this).parent();
    const path = $form.attr('action');
    const params = $form.serialize();
    sendAjaxRequest('patch', path, params).success(function(json) {
      let collection = new Collection(json);
      const $reading = $(`#row-${collection.id}`).find('.reading');
      if (collection.status == "Reading") {
        const source = $("#reading-template").html();
        const template = Handlebars.compile(source);
        const html = template(collection);
        $reading.append(html);
      } else {
        $reading.html("");
      };
    });
  });

  $('.deleteCollection').on('submit', function(e) {
    e.preventDefault();
    const $form = $(this);
    const path = $form.attr('action');
    const params = $form.serialize();
    sendAjaxRequest('delete', path, params).success(function(json) {
      let collection = new Collection(json);
      $(`tr#row-${collection.id}`).remove();
    });
  });

  $('.addToCollection').on('submit', function(e) {
    e.preventDefault();
    const $form = $(this);
    const path = $form.attr('action');
    const params = $form.serialize();

    $.post(path, params, function(json) {
      let collection = new Collection(json);
      Collection.changeAddButton(collection);
    }, 'json');
  });

  $('form#reviewForm').on('submit', function(e) {
    e.preventDefault();
    const $form = $(this);
    const path = $form.attr('action');
    const params = $form.serialize();
    const method = $form.children('input[name=_method]').attr('value') || 'post';

    sendAjaxRequest(method, path, params).success(function(json) {
      let collection = new Collection(json);
      const $review = $(`#${collection.id}-review`);
      const $rating = $(`#${collection.id}-rating`);

      if ($review.length == 0 && $rating.length == 0) {
        const html = collection.renderReview();
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
      collections.forEach(collection => {
        if (collection.review != null) {
          const source = $("#review-template").html();
          const template = Handlebars.compile(source);
          const html = template(collection);
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
