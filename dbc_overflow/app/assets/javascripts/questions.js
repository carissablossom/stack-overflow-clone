$(document).ready(function(){
  console.log("document ready")

  $(".new_question").submit(function(event){
    event.preventDefault()
    console.log("Making progress")
    data = $(this).serialize()
    url = $(this).attr("action")
    $(this).val('');

    submission = $.ajax({
      type: 'POST',
      url: url,
      data: data,
    });

    submission.done(function(response){
      console.log(response)
      $('.question_list').append(response)
    })
  });



});
