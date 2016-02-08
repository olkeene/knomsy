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

//= require bootstrap
//= require bootstrap-sprockets

//= require bootstrap-tokenfield
//= require bootstrap-typeahead-rails
//= require bootstrap-switch
//= require bootstrap-fileinput

//= require object-traverse
//= require object-to-formdata

//= require_directory .
//= require_self

// Disable auto discover for all elements:
// Dropzone.autoDiscover = false;

$(document).ready(function(){
  var body = $('body');
  var body_class = body.attr('class');

  if( body.hasClass('profiles') ){
    new window.Profiles.Controller();
  }

  if( body.hasClass('companies_new') || body.hasClass('companies_create') ){
    var ctrl = new window.Companies.Controller();
    ctrl.bind_new();
  }
});