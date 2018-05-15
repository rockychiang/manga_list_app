$( () => {
  $('#js-show-reviews').on('click', (e) => {
    e.preventDefault();
    const id = $('#js-show-reviews').data('id');
    $('#reviews').html("");
    $.get(`/users/${id}/collections`, (collections) => {
      collections.forEach(collection => {
        if (collection.review != null) {
          let html = `<div class='col-sm-4'>`;
          html += `<h3>${collection.manga.title}</h3>`;
          html += `<p>Rating: ${collection.rating}</p>`;
          html += `<p>${collection.review}</p>`;
          html += `</div>`;
          $('#reviews').append(html);
        };
      });
    }, 'json');
  });
});
