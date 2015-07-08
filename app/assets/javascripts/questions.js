$(document).ready(function(){
  newQuestionForm.init();
})

var newQuestionForm = {
  init: function(){
    $('.new_question').on('ajax:success', this.appendForm);
    $('.new_question').on('ajax:error', this.displayError);

  },
  appendForm: function(event, response) {
    console.log('success', arguments);
    console.log('event', event);
    // console.log('response', response);
    console.log('response', arguments[1]);


  },
  displayError: function() {
    console.log('fail', arguments);
  }

}

