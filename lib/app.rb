require 'sinatra'
require 'slim'

get '/' do
  slim :index
end

get '/namecard' do
  slim :'namecard/index'
end
