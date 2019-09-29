require 'sinatra'
require 'sinatra/r18n'
require "sinatra/subdomain"
require 'slim'
require 'octicons'

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

subdomain :card do
  get '/' do
    slim :'card/index'
  end

  get '/vcf' do
    content_type 'text/x-vcard'
    attachment 'msyk.vcf'
    slim :'card/vcf', layout: false
  end
end

get '/' do
  slim :index
end
