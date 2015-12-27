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

//= require jquery-ui/datepicker

//= require js-routes
//= require underscore

//= require react
//= require react_ujs

//= require bootstrap-tokenfield
//= require bootstrap-switch

//= require_directory .
//= require_self

$(document).ready(function(){
  var body = $('body');
  var body_class = body.attr('class');

  if( body.hasClass('profiles') ){
    new window.Profiles.Controller();
  }
});