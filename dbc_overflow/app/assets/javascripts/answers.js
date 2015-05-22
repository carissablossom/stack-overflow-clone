$(document).ready(function(){

var form = $(".new_answer")
  form.on('submit', function(event){
    event.preventDefault();

    var request = $.ajax({
      type: 'POST',
      url: $(this).attr('action'),
      data: $(this).serialize(),
      dataType: 'json',
    });
    request.done(function(data){
        var appendArea = $('.answers')
        appendArea.append(data.html)
        $('#answer_title').val('')
      $('#answer_content').val('')

    })

  })

  $('.button_to_answer').on('submit', '' function(event){
    event.preventDefault();
    var request = $.ajax({
      url: $(this).attr('action'),
      type: $(this).attr('method'),
      data: $(this).serialize(),
      dataType: 'json',

    })
    request.done(function(data){
      console.log(data)
      var answerId = data.answer.id
      var newVote = data.answer.vote
      var selection = "." + answerId
      var voteArea = $('div'+selection)
      voteArea.html(newVote)
    })
  })

})

