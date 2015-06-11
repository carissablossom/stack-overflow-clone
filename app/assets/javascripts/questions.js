$(document).ready(function(){
// $(document).on('ready', function(){ <-- not sure if it should stay this way
  $('.question_form').on('submit', function(e){
    e.preventDefault();
    console.log('we are in the form');

    var submission = $.ajax({
      type: 'POST',
      url: $(this).attr('action'),
      data: $(this).serialize(),
      dataType: 'JSON'
    });

    submission.done(function(data) {
      $('.error_messages').remove();
      var title = data.title;
      var content = data.content;
      $('#template').append(content);
      $('#template').append(title);

      // var questionTemplate = $('.question_template').clone();
      // $('.question_template').show();
    });

    submission.fail(function(data) {
      var error_messages = data.responseJSON;
      var error_messages_div = $('div')
    })
  });
});
