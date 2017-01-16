// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap/alert
//= require bootstrap/dropdown
//= require jquery-1.8.3.min.js
//= require jquery.fullPage.min.js
//= require_tree .
$(function(){
  $('#dowebok').fullpage({
    sectionsColor: ['#1bbc9b', '#4BBFC3', '#7BAABE'],
    anchors: ['home', 'joblist', 'about'],
    navigationTooltips: ['[Home]', '[JobList]', '[About]'],
    'navigation': true,
    loopBottom: true,
    //slidesNavigation: true, //是否显示左右滑块的项目导航
    menu: '#menu'
  });

  setInterval(function(){
      $.fn.fullpage.moveSlideRight();
  }, 3000);
});
