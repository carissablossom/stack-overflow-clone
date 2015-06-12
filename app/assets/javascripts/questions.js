$(document).ready(function(){
// $(document).on('ready', function(){ <-- not sure if it should stay this way
  $('.question_form').on('submit', function(e){
    e.preventDefault();
    console.log('we are in the form');

    var source = $('#sample-template').html();
    var template = Handlebars.compile(source);

    var submission = $.ajax({
      type: 'POST',
      url: $(this).attr('action'),
      data: $(this).serialize(),
      dataType: 'JSON'
    });

    submission.done(function(data) {
      $('#new_question').append(template(data))
    });

    submission.fail(function(data) {
      var error_messages = data.responseJSON;
      var error_messages_div = $('div')
    })
  });
});
