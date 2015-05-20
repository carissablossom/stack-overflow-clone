$(document).ready(function() {

  //For HandleBars
  var source = $('#question_block').html();
  var template = Handlebars.compile(source);

  $('#new_question').on('submit', function (event) {
    event.preventDefault();

    var url = $(this).attr('action');
    var data = $(this).serialize();
    var request = $.ajax({
      type: 'post',
      url: url,
      data: data,
      dataType: 'json'
    });

    request.done(function(data) {

      //$('ul').append('<li>' +data+ '</li>'); //non-handlebars way
      var context = {};
      context.data = data;
      $('ul').append(template(context)); //handlebars way
    });

    request.fail(function(data) {
      $('#new_question').prepend('<span id="error">You fucked up</span>');
    });

  });
  var source = $('#answer_block').html();
  var template = Handlebars.compile(source);

  $('#new_answer').on('submit', function (event) {
    event.preventDefault();

    var url = $(this).attr('action');
    var data = $(this).serialize();
    var request = $.ajax({
      type: 'post',
      url: url,
      data: data,
      dataType: 'json'
    });

    request.done(function(data) {
      var context = {};
      context.data = data;
      $('')
    })

  })
});
