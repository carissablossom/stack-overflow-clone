$(document).ready(function() {

  var question_form = function(question) {
    form = '<div class="the-question">' +
    '<h1><a href="/questions/' + question.id +'">' +question.title+ '</a></h1>' +
    '<form action="/questions/' + question.id +'/upvote" class="button_to" method="post"> <div><input type="submit" value="upvote" />' +
    '<input name="authenticity_token" type="hidden" value="FgKMyN0qn3AnpDm1TQUrBTauctAALzKtFBsoKASK7qE=" /></div></form>' +
    '<form action="/questions/' + question.id +'/downvote" class="button_to" method="post"> <div><input type="submit" value="downvote" />' +
    '<input name="authenticity_token" type="hidden" value="FgKMyN0qn3AnpDm1TQUrBTauctAALzKtFBsoKASK7qE=" /></div></form>' +
    '<p>0</p><p>' + question.content+ '!</p></div>'
    return form
  }

  $(".new_question").on('submit', function(e) {
    e.preventDefault();
    current = $(this)
    $.ajax({
      type: 'POST',
      url: $(this).attr('action'),
      dataType: 'json',
      data: $(this).serialize()
    }).done(function(response){
      $('.questions').append(question_form(response))
      current.find('input[name="question[title]"]').val('')
      current.find('textarea[name="question[content]"]').val('')
    });
  });

  $('body').on('click', '.button_to', function(e){
    e.preventDefault();
    current = $(this)
    $.ajax({
      type: 'POST',
      url: current.attr('action'),
      dataType: 'json',
      data: {}
    }).done(function(response){
      $(current.parent().find('p')[0]).text(response.count)
    });
  });
});

