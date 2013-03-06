require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
  'hello world'
end

get '/haha' do
  'haha'
end

get '/:name' do
  name = params['name']
  "Hi #{name}"
end
