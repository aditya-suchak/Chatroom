$(document).on('turbolinks:load', function() {
  if ($('#messages').length > 0){
    $('#messages').scrollTop($('#messages')[0].scrollHeight);
  }
});