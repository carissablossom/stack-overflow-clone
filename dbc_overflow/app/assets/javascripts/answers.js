
function bindAnswerEvents(){
  postNewAnswer();
};

function postNewAnswer(){
  $('input[value="Create Answer"]').on("click", function(e){
  e.preventDefault();
  var title = $("input[name='answer[title]']").val();
  var content = $("textarea[name='answer[content]']").val();
  // var data = {
  //   "answer[title]": title,
  //   "answer[content]": content
  // };
  var data = $('#new_answer').serialize();
  var post = $.ajax({
    type: 'post',
    url: '/answers',
    data: data,
    dataType: 'JSON',
    success: function(data){
      console.log(data)
      var answer =
      $('<div class="answer">
        <h3>'+data.title+'</h3>
        Point Count: <b>1</b>
        <a data-method="put" href="/answers/'+data.id+'/upvote" rel="nofollow">▲</a>
        <a data-method="put" href="/answers/'+data.id+'/downvote" rel="nofollow">▼</a>
        <p>'+data.content+'</p><hr>
      </div>')
      // var newAnswer = $(data);
      // $("input[name='answer[title]']").val("");
      // $("textarea[name='answer[content]']").val(" ");
      $('#answer_container').append(answer);
      }
    });
  });
};
