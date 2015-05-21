$(document).ready(function(){

  $('#new_question').on('submit', function(event){
    event.preventDefault();

    var request = $.ajax({
      method: 'post',
      url: $(this).attr('action'),
      data: $(this).serialize(),
      // dataType: 'json'
    });

    request.done(function(response){
      var question = response.title;
      var content = response.content;
      $('#question_container').append(response);
    })
  })


})
