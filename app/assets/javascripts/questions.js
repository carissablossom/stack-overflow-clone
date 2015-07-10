$(document).on("page:change", function() {
  $('#question_add').on("click", function(event){
    event.preventDefault();
    var $target = event.target;
    var path = $target.href;
    // debugger
    console.log(path);
    var request = $.ajax({
      url: path,
      type: "GET"
    })
    request.done(function(response){
      console.log(response);
      $('#question_add').hide();
      $('#question_index').append(response);
    });
    request.fail(function(response){
      console.log('i fail');
       console.log(response);
    });
  });

  $('#question_index').on('submit', '.new_question', function(event) {
    event.preventDefault();
    var $target = event.target;
    var path = $target.action;
    var request = $.ajax({
      url: path,
      type: "POST",
      data: $(this).serialize()
    });

    request.done(function(response){
      console.log(response);
      $('.new_question').hide();
      $('#question_add').show();
      $('#question_list').append(response);
    });

    request.fail(function(response){
      console.log('i fail');
       console.log(response);
    });
  });

  function vote(domElement) {
    domElement.on('click', function(event) {
      event.preventDefault();
      var $target = event.target;
      var path = $target.parentElement.action;
      var vote = $target.value;
      var request = $.ajax({
        url: path,
        type: "PUT",
        data: {vote: vote}
      });

      request.done(function(response){
        console.log(response);
        $('#question-vote').text("Votes: "+ response.vote);
      });

      request.fail(function(response){
        console.log('i fail');
         console.log(response);
      });
    });
  }

  vote($('.upvote'));
  vote($('.downvote'));

});
