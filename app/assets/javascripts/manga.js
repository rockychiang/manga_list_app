$(document).on('turbolinks:load', () => {
  $('form#reviewForm').on('submit', function(e) {
    e.preventDefault();
    const $form = $(this);
    const action = $form.attr('action');
    const params = $form.serialize();

    $.post(action, params, null, 'json')
    .success(function(json) {
      const source = $("#review-template").html();
      const template = Handlebars.compile(source);
      const html = template(json);
      $('#reviews').append(html);
    })
    .error(function(resp) {
      console.log("That's not good", resp);
    });
  });
});
