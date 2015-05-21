$(document).ready(function(){

  $('#new_answer').on('submit', function(event){
      event.preventDefault();
      alert('hi');
      var request = $.ajax({
        method: 'post',
        url: $(this).attr('action'),
        data: $(this).serialize(),
        dataType: 'json'
      })

      request.done(function(response){
        var question = response.title;
        var content = response.content;
        $('#answer_container').append(response);
      })
  })
})
