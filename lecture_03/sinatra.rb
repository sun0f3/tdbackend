
require 'sinatra'

get '/' do
  'Hello world!'
end

get '/users/:user_id' do
  "User id is #{params[:user_id]}"
end
