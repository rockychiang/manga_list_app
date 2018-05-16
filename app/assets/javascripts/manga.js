$(document).on('turbolinks:load', () => {
  $('#reviewForm').submit( (e)  => {
    e.preventDefault();
    console.log("Hijacked")
  });
});
