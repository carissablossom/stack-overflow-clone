$(document).on('page:change', function(){
  $('.question_form').on('submit', function(e){
    e.preventDefault();
    console.log('we are in the form');

    var source = $('#question-template').html();
    var template = Handlebars.compile(source);

    var submission = $.ajax({
      type: 'POST',
      url: $(this).attr('action'),
      data: $(this).serialize(),
      dataType: 'JSON'
    });

    submission.done(function(data) {
      $('#new_questions').append(template(data))
      $('.question_form')[0].reset();
    });

    submission.fail(function(data) {
      var error_messages = data.responseJSON;
      var error_messages_div = $('div')
    });
  });

  $('.new_answer').on('submit', function(e){
    e.preventDefault();
    console.log('we are in the form');

    var source = $('#answer-template').html();
    var template = Handlebars.compile(source);

    var submission = $.ajax({
      type: 'POST',
      url: $(this).attr('action'),
      data: $(this).serialize(),
      dataType: 'JSON'
    });

    submission.done(function(data) {
      $('#new_answers').append(template(data))
      $('.new_answer')[0].reset();
    });

    submission.fail(function(data) {
      var error_messages = data.responseJSON;
      var error_messages_div = $('div')
    });
  });
});
