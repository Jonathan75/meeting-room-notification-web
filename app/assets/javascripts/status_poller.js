function PollStatus() {
  $(function() {
    room_id = $("#room-status").data('room-id')
    if (room_id) {
      $.getJSON(
          "/rooms/" + room_id + ".json?web=true",
        function(json){ $('#room-status').text(json.status_description);
        });
    }
  });
}

setInterval( PollStatus, 15000);
