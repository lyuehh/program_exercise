require 'sinatra'
require 'sinatra/reloader' if development?

set :public_folder, File.dirname(__FILE__) + '/public'

helpers do
    def filename
        ((0..9).to_a + ('a'..'z').to_a + ('A'..'Z').to_a).shuffle
    end
end

get '/' do
  erb :index
end

post '/upload' do
    text = params[:text]
    file = params[:file]
    puts params
    puts "---: #{text}"
    puts file
    filepath = File.dirname(__FILE__) + '/public/tmp/' + 'a.jpg'
    puts file
    File.open(filepath, 'wb') do |f|
        f.write(file[:tempfile].read)
    end
    '/tmp/a.jpg'
end


get '/haha' do
  'haha'
end

get '/:name' do
  name = params['name']
  "Hi #{name}"
end