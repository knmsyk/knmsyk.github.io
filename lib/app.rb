require 'sinatra'
require 'slim'
require 'octicons'
require 'sinatra/r18n'

R18n::I18n.default = 'en'

helpers do
  def octicon(symbol, options = {})
    icon = Octicons::Octicon.new(symbol, options)
    icon.to_svg
  end
end

before do
  session[:locale] = 'ja' if request.env["HTTP_ACCEPT_LANGUAGE"].start_with? 'ja'
end

get '/' do
  slim :index
end

get '/card' do
  slim :'card/index'
end

get '/', host: 'card.msyk.works' do
  slim :'card/index'
end
