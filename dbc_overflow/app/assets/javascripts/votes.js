$(document).ready(function(){
	$('.question_upvote').on("click", function(e){
		e.preventDefault();
		var count = parseInt($('.question_point_count').text());
		var post = $.ajax({
      type: 'POST',
      url: $(this).attr('href'),
      data: { _method:'PUT'}
    });
    post.done(function(){
    	$('.question_point_count').text(count + 1);
    });
    post.fail(function(){
    	console.log("ajax failed");
    });
	});
	
	$('.question_downvote').on("click",function(e){
		e.preventDefault();
		var count = parseInt($('.question_point_count').text());
		var post = $.ajax({
      type: 'POST',
      url: $(this).attr('href'),
      data: { _method:'PUT'}
    });
    post.done(function(){
    	$('.question_point_count').text(count- 1);
    });
    post.fail(function(){
    	console.log("ajax failed");
    });
	});

	$('.answer_upvote').on("click", function(e){
		e.preventDefault();
		var id = $(this).parent().attr('id');
		var count = parseInt($(this).siblings('b').text());
		var post = $.ajax({
      type: 'POST',
      url: $(this).attr('href'),
      data: { _method:'PUT'}
    });
    post.done(function(){
    	$('.answer_point_count_'+id).text(count+1);
    });
    post.fail(function(){
    	console.log("ajax failed");
    });
	});

	$('.answer_downvote').on("click", function(e){
		e.preventDefault();
		var id = $(this).parent().attr('id');
		var count = parseInt($(this).siblings('b').text());
		var post = $.ajax({
      type: 'POST',
      url: $(this).attr('href'),
      data: { _method:'PUT'}
    });
    post.done(function(){
    	$('.answer_point_count_'+id).text(count-1);
    });
    post.fail(function(){
    	console.log("ajax failed");
    });
	});
});