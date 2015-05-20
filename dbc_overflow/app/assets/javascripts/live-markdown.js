$(function() {
	var liveCodeTitle = function(event) {
		$title = $('.live-md').find('h2');
		$title.text($(this).val());
	};

	var liveCodeContent = function(event) {
		$content = $('.live-md').find('p');
		$content.text($(this).val());
	};

	$('#question-form').on('keyup', 'input[name="question[title]"]', liveCodeTitle);
	$('#question-form').on('keyup', 'textarea[name="question[content]"]', liveCodeContent);
	$('#answer-form').on('keyup', 'input[name="answer[title]"]', liveCodeTitle);
	$('#answer-form').on('keyup', 'textarea[name="answer[content]"]', liveCodeContent);
});