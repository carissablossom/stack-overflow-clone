$(function(){

  var createNewQuestion = function(event){
    event.preventDefault();
    var source   = $("#entry-template").html();
    var template = Handlebars.compile(source);

    var request = $.ajax({
      type: $(this).attr('method'),
      url: $(this).attr('action'),
      data: $(this).serialize(),
      dataType: 'JSON'
    });

    request.done(function(response){
      $('.error_messages').remove();
      $('.questions').append(template(response));
    });
  };

  var voteQuestion = function(event){
    event.preventDefault();
    var $this = $(this);

    var request = $.ajax({
      type: 'GET',
      url: $this.attr('href'),
      dataType: 'JSON'
    });

    request.done(function(response) {
      var vote;
      if ($this.attr('href').includes('upvote'))
        vote = response.upvote;
      else
        vote = response.downvote;
      $this.siblings('span').text(vote);
    });
  }

  $('.new_question').on('submit', createNewQuestion);
  $('.questions').on('click', '.thumbs-up a', voteQuestion);
  $('.questions').on('click', '.thumbs-down a', voteQuestion);
});
