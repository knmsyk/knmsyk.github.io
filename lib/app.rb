require 'sinatra'
require 'slim'
require 'octicons'

helpers do
  def octicon(symbol, options = {})
    icon = Octicons::Octicon.new(symbol, options)
    icon.to_svg
  end
end

get '/' do
  slim :index
end

get '/namecard' do
  slim :'namecard/index'
end
