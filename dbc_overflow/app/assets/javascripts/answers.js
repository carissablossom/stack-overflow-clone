$(document).ready(function(){

  $('#new_answer').on('submit', function(event){
      event.preventDefault();
      var request = $.ajax({
        method: 'post',
        url: $(this).attr('action'),
        data: $(this).serialize(),
      })

      request.done(function(response){
        var question = response.title;
        var content = response.content;
        $('#answer-container').prepend(response);
      })
  })
})
