// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function(){
  $('.new_question').on('submit', function(e) {
    e.preventDefault();
    var $data = $(this).serialize();
    var $form = $(this);
    var request = $.ajax({
      method: "post",
      url: $(this).attr("action"),
      data: $data
    });
    request.done(function(response){
      $('#question_list').prepend(response);
      $form[0].reset();
    })
  })


  $('#question_list').on('click', '.up', function(e){
    e.preventDefault();
    var post = $(this).parents('.question');
    var link = $(post.children('.up')).attr('href');

    var request = $.ajax({
      method: "get",
      url: link,
      dataType: 'json',
    });
    request.done(function(response){
      $(post).children('span.votes').text(response.votes)
    });
  })
  // $($(this).parent()[0]).attr('href')
  $('#question_list').on('click', '.down', function(e){
    e.preventDefault();
    var post = $(this).parents('.question');
    var link = $(post.children('.down')).attr('href');

    var request = $.ajax({
      method: "get",
      url: link,
      dataType: 'json',
    });
    request.done(function(response){
      $(post).children('span.votes').text(response.votes)
    });
  })

})
