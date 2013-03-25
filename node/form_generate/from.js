var _buf = []; _buf.push("<?js\n\
  var user = [\"_method\", \"id\", \"password\", \"name\", \"dept\", \"status\", \"expire\", \"tel\", \"mobile\", \"join\", \"position\", \"address\"];\n\
?>\n\
\n\
<?js var i; ?>\n\
<?js for(i=0,i<user.length;i++) { ?>\n\
<div class=\"input_list\">\n\
  <span class=\"input_name\">群组账号：</span>\n\
  <input type=\"text\" class=\"input_area\" id=\"@{user[i]}\" name=\"@{user[i]}\" value=\"\" />\n\
  <i class=\"input_limit\">*</i>\n\
</div>\n\
<?js } ?>\n");
document.write(_buf.join(""));
