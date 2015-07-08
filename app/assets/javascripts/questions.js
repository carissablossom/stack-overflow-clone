$( document ).ready(function() {
  $('.question-link').on("click", function(event){
    event.preventDefault();

    var path = $(this).attr('href')
    request = $.ajax({
      url: path,
      type: "GET"
    })

    request.done(function(response){
      $('.questions').append(response);
    })

    request.fail(function(response){
      console.log("fail");
      console.log(response);
    })
  });
});
