
$(document).ready(function() {

  var voteButton = function(event){
    event.preventDefault();

    var request = $.ajax({
      type: 'POST',
      url: $(this).attr('action'),
    });

    request.done(function(data) {
      // console.log(data);
      $(".score-"+ data.id ).text(data.score);
    })
  };

  var newAnswer = function(event){
    event.preventDefault();

    var request = $.ajax({
      type: 'POST',
      url: $(this).attr('action'),
      data: $(this).serialize(),
      dataType: 'json'
    });

    request.done(function(data){
      console.log('DONE!');
      var content = data.body;
      console.log(content);

      $('#answers').append('<li>' + 'id: ' + data.id + '<p></p>' + 'body: ' + content + '<p></p>' + 'Score: ' + data.score + '</li>');
    });
      request.fail(function(data) {
      console.log(data);
      console.log('FAIL');
    })
  };

$('#new_answer').on('submit', newAnswer);
$('.button_to').on('submit', voteButton);
});
