// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require nprogress
//= require gauge/gauge.min
//= require progressbar/bootstrap-progressbar.min
//= require moment/moment.min
//= require datepicker/daterangepicker
//= require chartjs/chart.min
//= require custom
//= flot/jquery.flot
//= flot/jquery.flot.pie
//= flot/jquery.flot.orderBars
//= flot/jquery.flot.time.min
//= flot/date
//= flot/jquery.flot.spline
//= flot/jquery.flot.stack
//= flot/curvedLines
//= flot/jquery.flot.resize
//= require icheck/icheck.min
//= require pace/pace.min
//= require skycons/skycons.min
//= require api
//= require bot_setup
//= require custom
//= require wizard/jquery.smartWizard
//= require step3
//= require bootstrap-switch.min

$(document).ready(function(){
  $("[name='my-checkbox']").bootstrapSwitch();
  $(".btn-notification-filter").click(function() {    
    console.log("click");
    $(".table-notification-users").show();
  });  

  $(".step3-definition-remove").click(function() {    
    console.log("click");
    $(this).parent().parent().parent().remove();
  });
});