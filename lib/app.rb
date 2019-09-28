require 'sinatra'
require 'slim'

get '/' do
  slim :'namecard/index'
end
