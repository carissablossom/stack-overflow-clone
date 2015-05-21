// make div container in which markdown texts live
// Find keyCodes and bind that to keyup() events
title = $('#question_content').on('keypress').val();
content = $('#question_content').on('keypress').val();
$('.md_q_title').append(title);
$('.md_q_content').append(content);
