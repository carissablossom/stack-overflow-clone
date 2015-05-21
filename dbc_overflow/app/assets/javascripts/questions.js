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
        console.log(response)
        $('#question_container').append(response);


          // '<div class="uhhh">
        //   <a href="/questions/"' + response.id + '">
        //   <h1>' + question + '</h1></a><p>' + content + '</p>
        //   <div="tri">
        //   <a href="/questions/' + response.id + '/upvote?method=get"><img alt="Triangle" src="https://rittamdebnath.files.wordpress.com/2015/03/triangle.jpg" /></a>
        //   <a href="/questions/' + response.id + '/downvote?method=get"><img alt="Transparent triangle 1" src="http://le2020.com/assets/images/transparent-triangle-1.png" /></a>
        //   </div>
        //   <p>vote totals:' + response.vote_totals + '</p></div>');


      })
  })


})
