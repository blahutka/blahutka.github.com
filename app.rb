require 'sinatra'
require "sinatra/reloader"
require 'sinatra/cache'
require './site/db/models'
require "sinatra/advanced_routes"
require './site/views/cells/posts_cell'
require 'sinatra/partial'
require 'ostruct'

class Portfolio < Sinatra::Base


  set :public_folder, settings.root
  set :views, ['site', 'views']
  set :static_site, settings.root

  register Sinatra::Cache
  set :cache_enabled, true
  set :cache_environment, :development
  set :cache_fragments_output_dir, lambda { File.join(settings.public_folder, 'fragments') }
  set :cache_output_dir, lambda { settings.root }

  configure :development do
    register Sinatra::Reloader
    also_reload File.join(Portfolio.root, 'site/cells/posts/*.*')
    register Sinatra::AdvancedRoutes
  end

  get '/' do
    @portfolios = settings.portfolios
    erb :home
  end


  configure do
    register Sinatra::Partial
    set :partial_template_engine, :erb
    enable :partial_underscores

    set :portfolios do
      [
          OpenStruct.new(:id => 'najdijob', :name => 'Najdijob.cz', :description => "Job search engine.
              I build this application for myself. Server setup (capistrano), data grabbing
              from web. Data synchronization with Amazon S3 and web server.
              <a href=\"#\" onclick=\"$('.portfolio-tabs a:last').tab('show');\">Gems</a>",
                         :gems => [
                             ["rails", '2.2.2'],
                             ["geonames"],
                             ["ultrasphinx"],
                             ["capistrano"],
                             ["capistrano-ext"],
                             ["deprec"],
                             ["capistrano_colors"],
                             ["aws-s3"],
                             ["eventmachine"],
                             ["ebuilder"],
                             ["tlsmail"],
                             ["mysql2"],
                             ["mysqlplus"]
                         ]),
          OpenStruct.new(:id => 'adw', :name => 'Adwave.com', :description => "AdWave is a free cross-promotional
                         and advertising network enabling developers,
                        advertisers and publishers to grow their social apps.",
                         :gems => [
                             ["sass", "(css)"], ["jQuery", "(javascript)"], ['erb', "html"]
                         ]),
          OpenStruct.new(:id => 'dentservis', :name => 'Dentservis.cz', :description => "Contract management
                          for Dentist Laboratories. This is first stage prototyping (TwitterBootstrap) and design UI.
                          Some RubyOnRails setup and structure",
                         :gems => []),
          OpenStruct.new(:id => 'ftuner', :name => 'Facetuner.com', :description => 'Social application. I worked
                         as HTML/CSS webmaster', :gems => [['jQuery'], ['HTML'], ['CSS']]),
          OpenStruct.new(:id => 'pservis', :name => 'PohodovyServis.cz', :description => "Customer service
                         for electronics, PC etc. One place to deal with you service. I worked on whole application",
                         :gems => [[]]),
          OpenStruct.new(:id => 'rgiant', :name => 'RebateGiant', :description => "", :gems => []),
          OpenStruct.new()

      ]
    end
  end


end

