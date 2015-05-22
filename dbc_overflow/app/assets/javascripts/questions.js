$(document).ready(function(){

  var form = $(".new_question")
  var titleField = $('input[name="question[title]"]')
  var contentField = $('input[name="question[content]"]')
  //console.log(titleField)
  //console.log(contentField)

  form.on('submit', function(event){
    event.preventDefault();
    //console.log('hi')
    var request = $.ajax({
      type: 'post',
      url: $(this).attr('action'),
      data: $(this).serialize(),
      dataType: 'json',
    });

    request.done(function(data){
      var appendArea = $('.questions')
      appendArea.append(data.html)
      $('#question_title').val('')
      $('#question_content').val('')

      //console.log(data);
    });

    request.fail(function(data){
      //alert("It didn't work");
    });

  })


  $('.button_to').on('submit', function(event){
      event.preventDefault();
      var request = $.ajax({
        url: $(this).attr('action'),
        type: $(this).attr('method'),
        data: $(this).serialize(),
        dataType: 'json',
      })

      request.done(function(data){
        // console.log(data.question.vote)
        // console.log(data.question.id)
        var questionId = data.question.id
        var newVote = data.question.vote
        var selection = "." + questionId
        var voteArea = $('div'+selection)
        console.log(voteArea)
        voteArea.html(newVote)



      })


  })



});
