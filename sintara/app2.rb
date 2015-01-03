require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
  erb :index
end

get '/ajax' do
    "12312"
end

__END__
@@index
<html>
<head>
    <title>test</title>
    <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
</head>
<body>
<script type='text/javascript'>
$(function() {
    $('.a').on('click', function(e) {
        var hwnd = window.open("", "_blank");
        $.get('/ajax', function(r) {
            console.log(r);
            hwnd.location = 'http://baidu.com';
            //window.open('http://baidu.com', '_blank');
        });
    });
})
</script>
    <a href="javascript:;" class="a">btn</a>
</body>
</html>

