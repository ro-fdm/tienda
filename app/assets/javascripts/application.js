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

function remove_fields(link) {  
  $(link).prev('input[type=hidden]').val('1'); // poner el campo de destryoy a true
  $(link).closest('.fields').hide();           // escoder este line_itmes_field
  //event.preventDefault()                      // no ejecutes la accion normal de enlace 'ir a #'
  console.log("link ="+ link);
 }

function add_fields(link, association, content) {
 var new_id = new Date().getTime();
 //var regexp = new RegExp("new_" + association, "g")
 var regexp = new RegExp("\\[(\\d)\\]", "g");
 console.log("content ="+ content);
 $(link).before( content.replace(regexp, '['+new_id+']'));
  console.log("new_id ="+ new_id);
}

