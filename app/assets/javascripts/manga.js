class Collection {
  constructor(attributes) {
    this.id = attributes.id;
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

$(document).on('turbolinks:load', () => {
  $('form#reviewForm').on('submit', function(e) {
    e.preventDefault();
    const $form = $(this);
    const path = $form.attr('action');
    const params = $form.serialize();
    const method = $form.children('input[name=_method]').attr('value') || 'post';

    $.ajax({
      method: method,
      url: path,
      data: params,
      dataType: 'json'
    })
    .success(function(json) {
      let collection = new Collection(json);
      const $review = $(`#${collection.id}-review`);
      const $rating = $(`#${collection.id}-rating`);

      if ($review.length == 0 && $rating.length == 0) {
        const html = collection.renderReview();
        $('#reviews').prepend(html);
      } else {
        $review.text(collection.review);
        $rating.text(collection.rating);
      };
    })
    .error(function(resp) {
      console.log("Mayday, mayday", resp);
    });
  });
});
