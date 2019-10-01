# coding: utf-8
require 'sinatra'
require 'sinatra/r18n'
require "sinatra/subdomain"
require 'slim'
require 'octicons'
require './lib/models/product'

R18n::I18n.default = 'en'

helpers do
  def octicon(symbol, options = {})
    icon = Octicons::Octicon.new(symbol, options)
    icon.to_svg
  end

  def partial(page, options={})
    slim page.to_sym, options.merge!(:layout => false)
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
  products = [
    Product.new("Dots", "./images/dots.png", "iOS", "Coming in Spring 2020", "parts/dots-text", "parts/dots-quote"),
    Product.new("eny", "./images/eny.png", "iOS", "Coming in Summer 2020", "parts/eny-text", "parts/eny-quote"),
  ]
  slim :index, locals: {products: products}
end
