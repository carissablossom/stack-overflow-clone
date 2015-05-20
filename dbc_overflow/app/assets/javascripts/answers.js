
function bindAnswerEvents(){
  postNewAnswer();

};

function postNewAnswer(){
  $('input[value="Create Answer"]').on("click", function(e){
  e.preventDefault();
  var title = $("input[name='answer[title]']").val();
  var content = $("textarea[name='answer[content]']").val();
  var data = {
    "answer[title]": title,
    "answer[content]": content
  };
  var post = $.ajax({
    type: 'post',
    url: '/answers',
    data: data,
    dataType: 'JSON',
    success: function(data){
      console.log(data)
      var answer = data
      // var newAnswer = $(data);
      // $("input[name='answer[title]']").val("");
      // $("textarea[name='answer[content]']").val(" ");
      // $('#question_list').append(newQuestion);
      }
    });
  });
};
