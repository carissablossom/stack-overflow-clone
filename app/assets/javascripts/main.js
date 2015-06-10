$(document).ready(function() {
  console.log('READY')
  $('form').on('click', '.add_answer', function(e){
    e.preventDefault();
    var form = $(this).parent().parent()
    $.ajax({
      url: form.attr('action'),
      type: form.attr('method'),
      data: form.serialize()
    })
    .done(function(response){
      $('#answer_content').val('');
      $('.answer_container').append(response);
    })
    .fail(function(response){
      alert('Fail');
    })
  })

  $('.new_question').on('click', '.new_question_link', function(e){
    e.preventDefault();
    $.ajax({
      url: $(this).attr('href'),
      type: 'GET'
    })
    .done(function(response){
      $('.new_question').append(response);
      $('.new_question_link').hide();
    })
    .fail(function(){
      alert('Fail');
    })
  })

  $('.new_question').on('click', '.submit_question', function(e){
    e.preventDefault()

    var form = $(this).parent().parent();
    $.ajax({
      type: form.attr('method'),
      url: form.attr('action'),
      data: form.serialize()
    })
    .done(function(response){
      $('.list_questions').append(response);
      form.remove();
      $('.new_question_link').show();
    })
    .fail(function(response){
      alert('Fail');
    })
  })

  $('.answer_container').on('click', '.vote_answers', function(e){
    e.preventDefault()
    var _this = $(this);

    $.ajax({
      url: $(this).parent().attr('action'),
      type: 'POST'
    })
    .done(function(response){
      $(_this).parent().parent().siblings('.votes').html("Votes: " + response)
      // $(_this).parent().prev().html("Votes: " + response)
      console.log(response)
    })
    .fail(function(response){
      alert('Fail');
    })
  })

  $('.vote_questions').on('click', function(e) {
    e.preventDefault();

    $.ajax({
      url: $(this).closest('.vote_questions').parent().attr('action'),
      type: 'POST'
    })
    .done(function(response) {
      $('.question_votes').html(response)
    })
    .fail(function(response) {
      alert('fail!')
    })
  })

})
