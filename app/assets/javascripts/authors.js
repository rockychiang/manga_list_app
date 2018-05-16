$( () => {
  $('#js-next-author').on('click', (e) => {
    e.preventDefault();
    const nextId = parseInt($('#js-next-author').data('id')) + 1;
    $.get(`/authors/${nextId}`, (author) => {
      change(author);
    }, 'json');
  });

  $('#js-previous-author').on('click', (e) => {
    e.preventDefault();
    const prevId = parseInt($('#js-previous-author').data('id')) - 1;
    $.get(`/authors/${prevId}`, (author) => {
      change(author);
    }, 'json');
  });
});

function change(author) {
  $('#js-next-author').data("id", author["id"]);
  $('#js-previous-author').data("id", author["id"]);
  $('#authorName').text(author.name);
  $('#addManga').attr("href", `/authors/${author["id"]}/manga/new`);
  $('#mangaList').html('');
  author.mangas.forEach(manga => {
    const source = $("#manga-template").html();
    const template = Handlebars.compile(source);
    const html = template(manga);
    $('#mangaList').append(html);
  });
}
