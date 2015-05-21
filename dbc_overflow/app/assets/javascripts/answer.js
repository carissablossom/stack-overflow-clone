$(document).on("page:load", function() {

    var createNewAnswer = function(event){
    event.preventDefault();
    $('.error_messages').remove();
    console.log('hello');

    var source   = $("#answer-template").html();
    var template = Handlebars.compile(source);

    var request = $.ajax({
      type: $(this).attr('method'),
      url: $(this).attr('action'),
      data: $(this).serialize(),
      dataType: 'JSON'
    });

    request
      .done(function(response){
        $('.answers').append(template(response));
      })
      .fail(function(response) {
        var errors = JSON.parse(response.responseText)
        // debugger
        for (var i = 0; i < errors.length; i++)
          $('.answers').append("<p class='error_messages'>"+errors[i]+"</p>")
      });
  };

  var voteAnswer = function(event){
    event.preventDefault();
    var $this = $(this);

    var request = $.ajax({
      type: 'GET',
      url: $this.attr('href'),
      dataType: 'JSON'
    });

    request
      .done(function(response) {
        var vote;
        if ($this.attr('href').includes('upvote'))
          vote = response.upvote;
        else
          vote = response.downvote;
        $this.siblings('span').text(vote);
      })
  }

  $('.new_answer').on('submit', createNewAnswer);
  $('.answers').on('click', '.thumbs-up a', voteAnswer);
  $('.answers').on('click', '.thumbs-down a', voteAnswer);
})
