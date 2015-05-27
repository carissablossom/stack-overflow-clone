$(document).ready(function(){
  console.log("document ready")

  $(".new_question").on("submit", function(event){
    event.preventDefault()
    console.log("Making progress")
    data = $(this).serialize()
    url = $(this).attr("action")


    submission = $.ajax({
      type: 'POST',
      url: url,
      data: data,
      dataType: "json",
    });

    var source   = $("#entry-template").html();
    var template = Handlebars.compile(source);



    submission.done(function(response){
      console.log(response.content)
      $('.question_list').append(template(response))
    })
  });



});
