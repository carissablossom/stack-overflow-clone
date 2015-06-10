$(document).on('page:change', function() {
  var model = new Model()
  var view = new View()
  var controller = new Controller(model, view)
  bindListeners(controller)
})

var bindListeners = function(controller) {

  $('#new_answer').on('click', '.add_answer', function(e){
    e.preventDefault();
    controller.addAnswer()
  })

  $('.new_question').on('click', '.new_question_link', function(e){
    e.preventDefault();
    controller.newQuestion($(this))
  })

  $('.new_question').on('click', '.submit_question', function(e){
    e.preventDefault()
    controller.addQuestion()
  })

  $('.answer_container').on('click', '.vote_answers', function(e){
    e.preventDefault()
    controller.voteAnswer($(this))
  })

  $('.vote_questions').on('click', function(e) {
    e.preventDefault();
    controller.voteQuestion($(this))
  })
}
