$(document).on('page:change', function() {
  var controller = new Controller()
  bindListeners(controller)
})

function Controller() {
  this.ajaxRequest = function(url, type, data, doneMethod, failMethod) {
    $.ajax({ url: url, type: type, data: data })
    .done(function(response) { doneMethod(response) })
    .fail(function(response) { failMethod(response) })
  }

  this.addAnswer = function() {
    var form = $('#new_answer')

    var done = function(response) {
      $('#answer_content').val('');
      $('.answer_container').append(response);
    }
    var fail = function(response) {
      alert('Fail');
    }

    this.ajaxRequest(form.attr('action'), form.attr('method'), form.serialize(), done, fail)
  }

  this.newQuestion = function(target) {
    var done = function(response) {
      $('.new_question').append(response);
      $('.new_question_link').hide();
    }
    var fail = function(response) {
      alert('Fail');
    }

    this.ajaxRequest($(target).attr('href'), 'GET', {}, done, fail)
  }

  this.addQuestion = function() {
    var form = $('#new_question')

    var done = function(response) {
      $('.list_questions').append(response);
      $('#new_question').remove();
      $('.new_question_link').show();
    }
    var fail = function(response) {
      alert('Fail');
    }

    this.ajaxRequest(form.attr('action'), form.attr('method'), form.serialize(), done, fail)
  }

  this.voteAnswer = function(target) {
    var done = function(response) {
      $(target).parents('td').siblings('.votes').html("Votes: " + response)
    }
    var fail = function(response) {
      alert('Fail');
    }

    this.ajaxRequest($(target).closest('form.button_to').attr('action'), 'POST', {}, done, fail)
  }

  this.voteQuestion = function(target) {
    var done = function(response) {
      $('.question_votes').html(response)
    }
    var fail = function(response) {
      alert('Fail');
    }

    this.ajaxRequest($(target).closest('.vote_questions').parent().attr('action'), 'POST', {}, done, fail)
  }
}

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
