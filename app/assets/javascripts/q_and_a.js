var convert = new Markdown.Converter();

$(document).ready(function() {
  bindEvents();
});

function bindEvents(){
  $('#page-wrap').on('click', 'div.pagination a', pagination);
  $('#page-wrap').on('click', '.vote', vote);
  $('#answers').on('click', '.vote', ansVote);
  $('#new_question').on('submit', newQuestion);
  $('#new_answer').on('submit', newAnswer);
  $('#search').on('keyup', search);
  $('#answer_content').on('keyup', preview)
}

function pagination(e){
  e.preventDefault();
  var url = $(this).attr('href');
  $.get(url).success(function(data) {
    $('#page-wrap').html($(data));
  });
};

function newQuestion(e) {
  e.preventDefault();
  var data = $(this).serialize();
  $.ajax({
    url: $(this).attr('action'),
    type: 'POST',
    data: data + '&page=1',
    success: function(data) {
      $('#page-wrap').html($(data));
      $('#question_content').val('');
      $('#question_title').val('');
    }
  });
};

function newAnswer(e) {
  e.preventDefault();
  var data = $(this).serialize();
  $.ajax({
    url: $(this).attr('action'),
    type: 'POST',
    data: data,
    success: function(data) {
      $('#answers').append($(data));
      $('#answer_content').val('');
      $('#answer_title').val('');
    }
  });
}

function vote(e){
  e.preventDefault();
  var button = $(this);
  var url = $(this).attr('href');
  $.get(url).success(function(data) {
    button.siblings('span').text(data);
    $(button).parent().find('.vote').each(function(_, elem) {
      $(elem).replaceWith($(elem).html());
    });
  });
};

function ansVote(e){
  e.preventDefault();
  var button = $(this);
  var url = $(this).attr('href');
  $.get(url).success(function(data) {
    button.siblings('span').text(data);
    $(button).parent().find('.vote').each(function(_, elem) {
      $(elem).replaceWith($(elem).html());
    });
  });
};

function search(){
  var phrase = $(this).val().toLowerCase();
  if (phrase) {
    $.get('/questions/search/'+phrase).success(function(payload) {
      $('#page-wrap').html($(payload));
    });
  } else {
    $.get('/questions').success(function(payload) {
      $('#page-wrap').html($(payload));
    });
  }
}

function preview() {
  var markdown = $(this).val();
  var html = convert.makeHtml(markdown);
  $('#markdown').html(html);
}
