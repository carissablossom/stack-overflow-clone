$(function() {
	var newAnswerStr = function(answer) {
		str = '<li>' +
					  '<h3>'+ answer.title +'</h3>' +
					  '<p>'+ answer.content +'</p>' +
					  '<a class="vote" href="/answers/'+ answer.id +'/upvote">Upvote</a>' +
					  '<span> '+ answer.vote +' </span>' +
					  '<a class="vote" href="/answers/'+ answer.id +'/downvote">Downvote</a>' +
					'</li>';
		return str;
	};

	var createAnswer = function(event) {
		event.preventDefault();
		$('.errors').remove();
		$this = $(this);

		$.ajax({
			url: $this.attr('action'),
			type: 'POST',
			dataType: 'json',
			data: $this.serialize(),
		})
		.done(function(response) {
			console.log("success");
			// debugger;
			$('#answers').prepend(newAnswerStr(response));
			$this.find('input[name="answer[title]"]').val('');
			$this.find('textarea').val('');
		})
		.fail(function(response) {
			console.log("error");
			var errors = $.parseJSON(response.responseText);
			for (var i = 0; i < errors.length; i++) {
				$this.prepend('<p class="errors">'+ errors[i] +'</p>');
			};
		})
	};

	$('#answer-form').on('submit', createAnswer);
});