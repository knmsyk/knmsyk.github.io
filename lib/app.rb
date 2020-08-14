# coding: utf-8
require 'sinatra/base'
require 'sinatra/r18n'
require 'sinatra/subdomain'
require 'slim'
require 'sprockets'
require 'sinatra/sprockets-helpers'
require 'octicons'
require './lib/models/product'

class App < Sinatra::Base
  register Sinatra::R18n
  register Sinatra::Subdomain
  register Sinatra::Sprockets::Helpers
  set :sprockets, Sprockets::Environment.new(root)
  set :assets_prefix, '/assets'
  set :digest_assets, true

  R18n::I18n.default = 'en'

  configure do
    sprockets.append_path File.join(root, 'assets', 'stylesheets')
    sprockets.append_path File.join(root, 'assets', 'javascripts')
    sprockets.append_path File.join(root, 'assets', 'images')
    configure_sprockets_helpers
  end

  helpers do
    def octicon(symbol, options = {})
      icon = Octicons::Octicon.new(symbol, options)
      icon.to_svg
    end

    def partial(page, options={})
      slim page.to_sym, options.merge!(layout: false)
    end
  end

  before do
    session[:locale] = 'ja' if request.env['HTTP_ACCEPT_LANGUAGE'].start_with? 'ja'
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
      Product.new('Dots', 'dots.png', 'iOS', 'Coming in Spring 2020', 'parts/dots-text', 'parts/dots-quote'),
      Product.new('eny', 'eny.png', 'iOS', 'Coming in Summer 2020', 'parts/eny-text', 'parts/eny-quote'),
    ]
    slim :index, locals: {products: products}
  end

  subdomain :dots do
    get '/privacypolicy' do
      slim :privacypolicy, locals: {name: 'Dots app'}
    end

    get '/termsandconditions' do
      slim :termsandconditions, locals: {name: 'Dots app'}
    end
  end

  subdomain :eny do
    get '/privacypolicy' do
      slim :privacypolicy, locals: {name: 'eny app'}
    end

    get '/termsandconditions' do
      slim :termsandconditions, locals: {name: 'eny app'}
    end
  end
end
