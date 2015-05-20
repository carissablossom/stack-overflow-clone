// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


$(document).ready(function() {
  bindEvents();
});

function bindEvents(){
  $('#page-wrap').on('click', 'div.pagination a', pagination);
  $('#page-wrap').on('click', '.vote', vote);
  $('#answers').on('click', '.vote', ansVote);
  $('#new_question').on('submit', newQuestion);
  $('#new_answer').on('submit', newAnswer);
}

function pagination(e){
  e.preventDefault();
  var url = $(this).attr('href');
  $.ajax({
    url: url,
    type: 'GET',
    success: function(data) {
      $('#page-wrap').html($(data));
    }
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
  $.ajax({
    url: url,
    type: 'GET',
    success: function(data) {
      button.siblings('span').text(data);
      $(button).parent().find('.vote').each(function(_, elem) {
        $(elem).replaceWith($(elem).html());
      });
    }
  });
};

function ansVote(e){
  e.preventDefault();
  var button = $(this);
  var url = $(this).attr('href');
  $.ajax({
    url: url,
    type: 'GET',
    success: function(data) {
      button.siblings('span').text(data);
      $(button).parent().find('.vote').each(function(_, elem) {
        $(elem).replaceWith($(elem).html());
      });
    }
  });
};
