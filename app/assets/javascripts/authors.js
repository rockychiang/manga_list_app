$( () => {
  $('#js-next-author').on('click', (e) => {
    e.preventDefault();
    const nextId = parseInt($('#js-next-author').data('id')) + 1;

  });
});
