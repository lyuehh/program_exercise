var _ = require('underscore');
var fs = require('fs');
var uo = require('./user');

_.each(uo, function(v, k) {
  console.log('k: ' + k + ', v: ' + v);
});


var t = [
  '<% _.each(uo, function(v, k) { %>',
  '<div class="input_list">',
  '<span class="input_name"><%= v  %>: </span>',
  '<input type="text" class="input_area" id="<%= k %>" name="<%= k %>" value="" />',
  '<i class="input_limit">*</i>',
  '</div>',
  '<% }); %>'
];

var a = ["_method", "id", "password", "name", "dept", "status", "expire", "tel", "mobile", "join", "position", "address"];

var h = _.template(t.join(""), {uo: uo});
console.log(h);
