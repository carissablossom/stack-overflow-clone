function View() {
  this.clearAnswerContent = function() {
    $('#answer_content').val('');
  }

  this.addToAnswerContainer = function(response) {
    $('.answer_container').append(response);
  }


}
