$(document).ready(function() {
  //$(document).on(pageChange(function...something?)))
  $('#new_question').on('submit', function (event) {
    event.preventDefault();

    //For HandleBars
    var source = $('#question_block').html();
    var template = Handlebars.compile(source);

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



  $('.q_up').on('submit', function(event){
    event.preventDefault();

    var upvotes = $(this).prev();
    var data = $(this).serialize();
    var url = $(this).attr('action');
    var request = $.ajax({
      url: url,
      type: 'post',
      data: data
    });

    request.done(function(response){
      upvotes.text(response.votes);
    });

    request.fail(function(response){
      console.log('failure');
    });

  });

  $('.q_down').on('submit', function(event){
    event.preventDefault();
    var downvotes = $(this).prev().prev();
    var data = $(this).serialize();
    var url = $(this).attr('action');
    console.log(downvotes);
    var request = $.ajax({
      url: url,
      type: 'post',
      data: data
    });

    request.done(function(response){
      downvotes.text(response.votes);
      console.log(downvotes);
    });

    request.fail(function(response){
      console.log('failure');
    });

  });
});
