class Collection {
  constructor(attributes) {
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
    const action = $form.attr('action');
    const params = $form.serialize();

    $.post(action, params, null, 'json')
    .success(function(json) {
      let collection = new Collection(json);
      const html = collection.renderReview();

      $('#reviews').append(html);
    })
    .error(function(resp) {
      console.log("Mayday, mayday", resp);
    });
  });
});
