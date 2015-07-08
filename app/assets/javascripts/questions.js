$(document).ready(function(){
  newQuestionForm.init();
  addQuestionLink.init();

})

var addQuestionLink = {
  init: function(){
    $('.add-question-link').on('ajax:success', this.appendForm);
    $('.add-question-link').on('ajax:error', this.displayError);

  },
  appendForm: function(event, response) {
    console.log('response', response);
    $('.add-question-link').hide();
    $('.add-question-form').append(response);
  },
  displayError: function() {
    console.log('fail', arguments);
  }

}

var newQuestionForm = {
  init: function(){
    $('.new_question').on('ajax:success', this.appendForm);
    $('.new_question').on('ajax:error', this.displayError);

  },
  appendForm: function(event, response) {
    console.log('success', arguments);
    console.log('response', response);

  },
  displayError: function() {
    console.log('fail', arguments);
  }

}

// $.ajax({
//   //...
// }).success(function(data) {
//   data // {title: "Hello", content: "World"}
//   $("<li class='question'><h4> " + data.title + "</h4></li>");
// })

// $.ajax({
//   //...
// }).success(function(data) {
//   $('.question_list').append(data);
// })
