var fs = require('fs');
var xlsx = require('node-xlsx');
var _  = require('underscore');
var child = require('child_process');
var ls = child.exec('logname');
ls.stdout.on('data',function(data){
  var usr_name = data.replace(/\r|\n/g,'');
  //path cn-big5.xlsx
  var __dirname = '/Users/' + usr_name +'/Documents/';
  var file_buffer = fs.readFileSync(__dirname + '/number.xlsx');
  var xlsx_file_obj = xlsx.parse( file_buffer );

  var all = [];
  _.each( xlsx_file_obj.worksheets ,function(sheet) {
    var sheet_data = sheet.data;
    _.each(sheet_data, function(row, row_index) {
      var arr;
      if(row_index % 2 === 0) {
        arr = _.pluck(row, 'value');
      } else {
        arr = _.pluck(row, 'value');
      }
      all.push(arr);
    });
  });

  var ret = _.reduce(all, function(memo, a) {
    if(memo.index % 2 === 0) {
      memo.keys.push(a);
    } else {
      memo.values.push(a);
    }
    memo.index = memo.index + 1;
    return memo;
  }, {index: 0, keys: [],values: []});

  var all_obj = [];
  for (var i = 0; i < ret.keys.length; i += 1) {
    all_obj.push(_.object(ret.keys[i], ret.values[i]));
  }

  var final = _.reduce(all_obj, function(memo, l) {
    return _.extend(memo, l);
  }, {});

  var option = {
    flags:'w',
    encodeing:'utf-8',
    mode:'0666'
  };

  var fw_stream_tw = fs.createWriteStream( __dirname + '/all_code.json',option);
  fw_stream_tw.write(JSON.stringify(final, null, 2));

});
