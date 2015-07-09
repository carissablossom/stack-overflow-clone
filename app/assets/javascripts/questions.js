$( document ).on('page:change', function() {

  $('.question-link').on("click", function(event){
    event.preventDefault();

    var link = $(this);
    var path = link.attr('href');
    request = $.ajax({
      url: path,
      type: "GET"
    })

    request.done(function(newQuestionForm){
      link.replaceWith(newQuestionForm);
        // console.log(response)
    })

    request.fail(function(response){
      console.log("fail");
      console.log(response);
    })
  });

  $('.new-question-form-container').on('submit', '.new_question', function(event) {
    event.preventDefault();

    var path = $(this).attr('action')
    var data = $(this).serialize()

    var request = $.ajax({
      type: 'POST',
      url: path,
      data: data,
      dataType: 'JSON'
    })

    request.done(function(question){
      console.log(question);
      $('.question-list').append(question.html);
      $('.new_question input#question_title').val('')
      $('.new_question input#question_content').val('')
    })

    request.fail(function(response){
      console.log('fail')
      console.log(response)
    })
  })
});


