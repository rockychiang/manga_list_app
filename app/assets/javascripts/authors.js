$(document).on('turbolinks:load', () => {
  $('#js-next-author').on('click', function(e) {
    e.preventDefault();
    const nextId = parseInt($(this).data('id')) + 1;
    getAuthor(nextId);
  });

  $('#js-previous-author').on('click', function(e) {
    e.preventDefault();
    const prevId = parseInt($(this).data('id')) - 1;
    getAuthor(prevId);
  });
});

function getAuthor(id) {
  $.get(`/authors/${id}`, (author) => { change(author) }, 'json');
};

function change(author) {
  $('#js-next-author').data("id", author.id);
  $('#js-previous-author').data("id", author.id);
  $('#authorName').text(author.name);
  $('#addManga').attr("href", `/authors/${author.id}/manga/new`);
  $('#mangaList').html('');
  author.mangas.forEach(manga => {
    const source = $("#manga-template").html();
    const template = Handlebars.compile(source);
    const html = template(manga);
    $('#mangaList').append(html);
  });
  $('.mangaAuthor').attr("href", `/authors/${author.id}`).text(author.name);
};
