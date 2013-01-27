$(document).ready(function() {
 $('#refresh-board').
 bind("ajax:success", function(evt, data, status, xhr) {
   $('#users-table').remove();
       $('#board').append(data.html);
 }).
 bind("ajax:error", function(evt, data, status, xhr) {
   alert("Refresh failed. Please try again.");
 });

 function refreshBoard() {
   $('#refresh-board').click();
 }
 
 /* Automatically refresh every 10 seconds */
 window.setInterval(refreshBoard, 10000);
});