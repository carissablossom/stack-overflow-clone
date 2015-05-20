$(function() {
	var voteQuestion = function(event) {
		event.preventDefault();
		$link = $(this);
		$.getJSON($link.attr('href'), function(data) {
			$link.siblings('span').text(' ' + data.vote + ' ');
		});
	};

	$('body').on('click', '.vote', voteQuestion);
});