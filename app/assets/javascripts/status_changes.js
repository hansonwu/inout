$(document).ready(function() {
$('#refresh-board')
  .bind("ajax:success", function(evt, data, status, xhr) {
    $('#users-table').html(data.html)
  });
});