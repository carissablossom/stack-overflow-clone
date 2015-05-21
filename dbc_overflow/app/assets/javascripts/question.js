$(function() {
	var newQuestionStr = function(question) {
		var str = "<li>" +
								"<a class='vote' href='/questions/"+ question.id +"/upvote'>▲</a>" +
								"<span id='"+ question.id +"'> "+ question.vote +" </span>" +
								"<a class='vote' href='/questions/"+ question.id +"/downvote'>▼</a>" +
								"<h2><a href='/questions/"+ question.id +"'>"+ question.title +"</a></h2>" +
								"<p>"+ question.content +"</p>" +
							"</li>";
		return str;
	};
	
	var createQuestion = function(event) {
		event.preventDefault();
		$('.live-md').find('div').children().remove();
		$('.errors').remove();
		$this = $(this);
		$.ajax({
			url: $(this).attr('action'),
			type: 'POST',
			dataType: 'json',
			data: $this.serialize(),
		})
		.done(function(response) {
			console.log("success");
			$('#questions').prepend(newQuestionStr(response));
			$this.find('input[name="question[title]"]').val('');
			$this.find('textarea').val('');
		})
		.fail(function(response) {
			console.log("error");
			var errors = $.parseJSON(response.responseText);
			for (var i = 0; i < errors.length; i++) {
				$this.prepend('<p class="errors">'+ errors[i] +'</p>');
			};
		});
	};


	$('#question-form').on('submit', createQuestion);
});