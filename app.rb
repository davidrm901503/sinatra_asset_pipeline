require 'sinatra/base'
require 'sinatra/asset_pipeline'
require 'sprockets'
require 'sprockets-helpers'

class App < Sinatra::Base
  # Include these files when precompiling assets
  set :assets_precompile, %w(application.js application.css custom.js *.png *.jpg *.svg *.eot *.ttf *.woff *.woff2)

  # The path to your assets
  set :assets_paths, %w(assets)

  set :assets_prefix, '/assets' 


  # Serve assets using this protocol (http, :https, :relative)
  set :assets_protocol, :http

  # CSS minification
  set :assets_css_compressor, :sass

  # JavaScript minification
  set :assets_js_compressor, :uglifier

  # Register the AssetPipeline extension, make sure this goes after all customization
  register Sinatra::AssetPipeline

  get '/' do
    erb :index
  end

  run! if app_file == $0
end
