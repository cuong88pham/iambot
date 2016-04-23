$(document).ready(function(){
  $('.btn-action').click(function(){
    var parent = $(this).parent();
    var text   = $(this).text();
    parent.append(text);
  });

  $('.add_button_welcome').click(function(){
    var button = '<div class="col-md-12 col-sm-12 col-xs-12"><div class="col-md-3 col-sm-3 col-xs-3 pull-right"><button class="btn btn-block btn-primary">Click to edit</button></div></div>';
    $('.bot_welcome_area').append(button);
  });
});
