require 'sinatra'
require "sinatra/reloader"
require 'sinatra/cache'
require './site/db/models'
require "sinatra/advanced_routes"
require './site/views/cells/posts_cell'

class Portfolio < Sinatra::Base


  set :public_folder, 'site/public'
  set :views, ['site', 'views']
  set :static_site, 'site/public'

  #register Sinatra::Cache
  #set :cache_enabled, true
  #set :cache_environment, :development
  #set :cache_fragments_output_dir, lambda { File.join(settings.public_folder, 'fragments') }
  #set :cache_output_dir, lambda { settings.public_folder }

  configure :development do
    register Sinatra::Reloader
    also_reload File.join(Portfolio.root, 'site/cells/posts/*.*')
    register Sinatra::AdvancedRoutes
  end

  get '/' do
    @post = Post.first
    erb :post
  end

  get '/posts/detail', :provides => :html do
    PostsCell.append_view_path("site/views/cells")
    erb 'posts/detail'.to_sym
  end

end

