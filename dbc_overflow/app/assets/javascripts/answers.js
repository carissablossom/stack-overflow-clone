// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function(){
  $('.new_answer').on('submit', function(e){
    e.preventDefault();
    var $form = $(this);
    var request = $.ajax({
      method: "post",
      url: $(this).attr("action"),
      data: $form.serialize()
    });
    request.done(function(response){
      $('#answer_list').prepend(response);
      $form[0].reset();
    })
  });

  // $('.fa fa-thumbs-o-up').on('click', function(e){
  // 	e.preventDefault();
  // 	debugger;
  // });
})