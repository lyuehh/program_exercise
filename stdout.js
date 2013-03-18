var cmd = 'curl -i --user-agent ["' + agent + '"] -e ' + refer + ' ' + url;
var curl = childProcess.exec(cmd);
curl.stdout.on('data', function(data) {
  console.log(data);
});

