$(function() {
	var markDown = function(sentenceArray) {
		var str = '';

		for (var i = 0; i < sentenceArray.length; i++) {
			if (sentenceArray[i].includes('######')) {
				sentenceArray[i] = '<h6>'+ sentenceArray[i].slice(6) +'</h6>';
			} else if (sentenceArray[i].includes('#####')) {
				sentenceArray[i] = '<h5>'+ sentenceArray[i].slice(5) +'</h5>';
			} else if (sentenceArray[i].includes('####')) {
				sentenceArray[i] = '<h4>'+ sentenceArray[i].slice(4) +'</h4>';
			} else if (sentenceArray[i].includes('###')) {
				sentenceArray[i] = '<h3>'+ sentenceArray[i].slice(3) +'</h3>';
			} else if (sentenceArray[i].includes('##')) {
				sentenceArray[i] = '<h2>'+ sentenceArray[i].slice(2) +'</h2>';
			} else if (sentenceArray[i].includes('#')) {
				sentenceArray[i] = '<h1>'+ sentenceArray[i].slice(1) +'</h1>';
			} else {
				sentenceArray[i] = '<p>'+ sentenceArray[i] +'</p>';
			}
			str += sentenceArray[i];
		};

		return str;
	};

	var liveCodeTitle = function(event) {
		var $title = $('.live-md').find('h2');
		$title.text($(this).val());
	};

	var liveCodeContent = function(event) {
		var $body = $('.live-md').find('div')
		var $content = $body.children();
		$content.remove();
		var strings = $(this).val().split('\n');
		console.log($(markDown(strings)));
		$body.append($(markDown(strings)));
	};

	$('#question-form').on('keyup', 'input[name="question[title]"]', liveCodeTitle);
	$('#question-form').on('keyup', 'textarea[name="question[content]"]', liveCodeContent);
	$('#answer-form').on('keyup', 'input[name="answer[title]"]', liveCodeTitle);
	$('#answer-form').on('keyup', 'textarea[name="answer[content]"]', liveCodeContent);
});