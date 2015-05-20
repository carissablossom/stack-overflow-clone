function bindVoteEvents(){
  updateVoteCount();
};

function updateVoteCount(){
  $('body').on('click', '.vote', function(e){
    e.preventDefault();
    e.stopPropagation();
    console.log("NOPE")
    var link = $(e.target)
    var parent = link.closest('div')
// debugger
    var voteHit = $.ajax({
      url: link.attr('href'),
      method: 'PUT',
      dataType: 'JSON'
    });

    voteHit.done(function(object){
      console.log ("hellllllooooo")
      votes = object.point_count;
      $(parent).children('span').text(votes);
    });

  });
};
