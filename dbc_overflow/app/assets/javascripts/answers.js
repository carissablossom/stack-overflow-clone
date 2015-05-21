console.log('shout')
$(document).ready(function() {
  $('#new_answer').on('submit', function(event){
    event.preventDefault();
    // alert("hello");
    // alert('yup');

    var request = $.ajax({
      type: 'POST',
      url: $(this).attr('action'),
      data: $(this).serialize(),
      dataType: 'json'
    });

    request.done(function(data){
      // debugger
      console.log('DONE!');
      var content = data.body;
      console.log(content);
      // debugger
      $('#answers').append('<li>' + 'id: ' + data.id + '<p></p>' + 'body: ' + content + '<p></p>' + 'Score: ' + data.score + '</li>');
      // $('#answers').append('<li>' + 'body: ' + content + '</li>');
      // $('#answers').append('<li>' + 'Score: ' + data.score + '</li>');
    });
    request.fail(function(data) {
      console.log('FAIL');
    })


  });
});
