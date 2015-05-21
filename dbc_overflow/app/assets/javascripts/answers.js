$(document).ready(function() {

  $('#new_answer').on('submit', function(event) {
    event.preventDefault();

    var source = $('#answer_block').html();
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
      var context = {};
      context.data = data;
      $('.answer_div').append(template(context));
    });
    request.fail(function(data){
      console.log("we failed");
    });

  });

  $('.a_up').on('submit', function(event){
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

  $('.a_down').on('submit', function(event){
    event.preventDefault();
    var downvotes = $(this).prev().prev();
    var data = $(this).serialize();
    var url = $(this).attr('action');
    var request = $.ajax({
      url: url,
      type: 'post',
      data: data
    });

    request.done(function(response){
      downvotes.text(response.votes);
    });

    request.fail(function(response){
      console.log('failure');
    });

  });
});
