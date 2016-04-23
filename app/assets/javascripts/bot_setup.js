$(document).ready(function(){
  $('.btn-action').click(function(){
    var parent = $(this).parent();
    var text   = $(this).text();
    parent.append(text);
  })
})