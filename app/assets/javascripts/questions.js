$(document).ready(function(){
  addQuestionLink.init();
  newQuestionForm.init();
})

var addQuestionLink = {
  init: function(){
    $('.add-question-link').on('ajax:success', this.appendForm);
    $('.add-question-link').on('ajax:error', this.displayError);

  },
  appendForm: function(event, response) {
    $('.add-question-link').hide();
    $('.add-question-form').append(response);
  },
  displayError: function() {
    console.log('fail', arguments);
  }

}

var newQuestionForm = {
  init: function(){
    $('.add-question-form').on('ajax:success', this.appendForm);
    $('.add-question-form').on('ajax:error', this.displayError);

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
