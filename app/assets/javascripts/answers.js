$(document).on("page:change", function() {

  $('form').on('submit', function(event) {
    event.preventDefault();
    var $target = event.target;
    var path = $target.action;
    var request = $.ajax({
      url: path,
      type: "POST",
      data: $(this).serialize()
    })

    request.done(function(response){
      console.log(response);
      $('#answer_body').append(response);
      var voteEls = $('.upvote_answer, .downvote_answer');
      voteEls.off('click');
      vote(voteEls);

      $('#answer_answer').val("");
      debugger

    });

    request.fail(function(response){
      console.log(response)
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
        console.log(response.vote);
        $("td[data-answer-id="+response.id+"]").text("Votes: "+ response.vote);
      });

      request.fail(function(response){
        console.log('i fail');
         console.log(response);
      });
    });
  }

  vote($('.upvote_answer'));
  vote($('.downvote_answer'));

});
