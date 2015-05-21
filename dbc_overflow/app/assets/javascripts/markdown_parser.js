MarkdownParser = function(){};

MarkdownParser.prototype.preview = function(input_field, output_div){
  $(input_field).on('keyup', function(event){
    var formText = $(input_field).val();
    $(output_div).html(formText);
  });
}
