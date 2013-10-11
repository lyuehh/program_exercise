require 'sinatra'

get '/' do
    {name: 'hello', body: 'world'}
end
