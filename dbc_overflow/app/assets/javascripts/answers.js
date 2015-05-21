$(document).ready(function(){

bindAnswerEvents();
bindQuestionEvents();
bindVoteEvents();

});

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
      console.log(data);
      console.log("AJAX BABY")
      $('#answer_container').prepend(buildAnswer(data));
      $("input[name='answer[title]']").val("");
      $("textarea[name='answer[content]']").val(" ");
      }
    });
  });
};

function buildAnswer(answerData){
      var skeleton =
      $('<div class="answer">' +
          '<h3>' +answerData.title+ '</h3>' +
          'Point Count:' + '<span>1</span>' +
          '<a class="vote" data-method="put" href="/answers/'+answerData.id+'/upvote" rel="nofollow">' +'▲' + '</a>' +
          '<a class="vote" data-method="put" href="/answers/'+answerData.id+'/downvote" rel="nofollow">' + '▼' + '</a>' +
          '<p>'+answerData.content+'</p>' +'<hr>' +
          '</div>');
      // Darwin is a genius
      return skeleton;
};
