// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready(function(){

   $('#new_question').on('submit', function(event){
      event.preventDefault();
      var source = $('#questions_template').html();
      var template = Handlebars.compile(source);
      var form_data = $(this).serialize()
      var url = $(this).attr('action')

      var request = $.ajax({
        url: url,
        method: 'post',
        data: form_data,
        dataType: 'json'
      }).done(function(response){
        console.log(response);
        // var context = response.title
        // console.log(context);
        $("#question_container").append(template(response))



      })



   })

})
