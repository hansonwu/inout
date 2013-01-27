$(document).ready(function() {
$('#refresh-board')
  .bind("ajax:success", function(evt, data, status, xhr) {
    $('#users-table').html(data.html)
  });
});

function refreshBoard() {
  $('#refresh-board').click();
}
/* Automatically refresh every 10 seconds */
window.setInterval(refreshBoard, 10000);