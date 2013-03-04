require 'sinatra'
require 'sinatra/reloader' if development?

enable :sessions, :logging
set :static, true
set :public_folder, 'public/'
set :views, 'views/'

get '/' do
  'hello world'
end

get '/haha' do
  'haha'
end

get '/log' do
  info = params['info']
  File.open('log.log', 'a') do |f|
    f.puts Time.now.to_s + ': ' + info
  end
end
