

function bindQuestionEvents(){
  postNewQuestion();

};

function postNewQuestion(){
  $('input[value="Create Question"]').on("click", function(e){
  e.preventDefault();
  var title = $("input[name='question[title]']").val();
  var content = $("textarea[name='question[content]']").val();
  var data = {
    "question[title]": title,
    "question[content]": content
  };
  var post = $.ajax({
    type: 'post',
    url: '/questions',
    data: data,
    success: function(response){
      console.log("AJAX")
      var newQuestion = $(response);
      $("input[name='question[title]']").val("");
      $("textarea[name='question[content]']").val(" ");
      $('#question_list').append(newQuestion);
      }
    });
  });
};
