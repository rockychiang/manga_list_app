$( () => {
  $('#js-next-author').on('click', (e) => {
    e.preventDefault();
    const nextId = parseInt($('#js-next-author').data('id')) + 1;
    $.get(`/authors/${nextId}`, (author) => {
      $('#authorName').text(author.name);
      $('#addManga').attr("href", `/authors/${author.id}/manga/new`);
      
    }, 'json');
  });
});
