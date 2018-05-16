$(document).on('turbolinks:load', () => {
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
