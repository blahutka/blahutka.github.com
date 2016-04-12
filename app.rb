require 'sinatra'
require "sinatra/reloader"
require 'sinatra/cache'
require './site/db/models'
require "sinatra/advanced_routes"
# require './site/views/cells/posts_cell'
require 'sinatra/partial'
require 'ostruct'
require 'active_support'

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
    # also_reload File.join(Portfolio.root, 'site/cells/posts/*.*')
    register Sinatra::AdvancedRoutes
  end

  get '/' do
    @portfolios = settings.portfolios
    erb :home
  end

  def self.gem(params)
    OpenStruct.new(params)
  end

  configure do
    register Sinatra::Partial
    set :partial_template_engine, :erb
    enable :partial_underscores


    set :portfolios do
      [OpenStruct.new(id: 'trackwave', name: 'Trackwave.com/Cor.us, USA', description: 'Cor.us is Survey application, that collects data from customers in a store.
                      I worked on the admin part of the application. Ruby, GUI HTML/CSS, Javascript',
                      :gems => [gem(:name => 'rails', full_name: 'Rails', version: '3.2', featured: true),
                                gem(name: 'twitter-bootstrap-rails', full_name: 'Twitter Bootstrap', version: '3.2', fatured: true),
                                gem(name: 'coffee-rails', full_name: 'Coffee Script'),
                                gem(name: 'sass-rails', full_name: 'Sass CSS') ,
                                gem(name: 'ruby', full_name: 'Ruby 1.9', version: '1.9'),
                                gem(:full_name => 'jQuery', name: 'jquery-rails', :url => 'http://jquery.com'),
                                gem(:name => 'pg', :full_name => 'PostgreSql')

                      ]),
       OpenStruct.new(id: 'brian', name: 'Hyper Local Media Inc, USA',
                      description: 'CMS for local Newspapers. It was old web app which I converted to Twitter Bootstrap.
                      Simultaneously I was adding new functions (Ruby, Javascript)', gems: [
               gem(:name => 'rails', :full_name => 'Ruby on Rails', :version => '3.2', :featured => true),
               gem(name: 'twitter-bootstrap-rails', full_name: 'Twitter Bootstrap', version: '2.2', fatured: true),
               gem(name: 'sass-rails', full_name: 'Sass CSS'),
               gem(name: 'ruby', full_name: 'Ruby 1.9', version: '1.9'),
               gem(name: 'rails-stripe', full_name: 'Stripe payment'),
               gem(:name => 'jquery-rails', :full_name => 'jQuery', :url => 'http://jquery.com')
           ]),

       OpenStruct.new(:id => 'najdijob', :name => 'Najdijob.cz', :description => "Job search engine.
              I build this application for myself. Server setup (capistrano), data grabbing
              from web. Data synchronization with Amazon S3 and web server.",
                         :gems => [
                             gem(:name => 'rails', :full_name => 'Ruby on Rails', :version => '2.2.2', :featured => true),
                             gem(:name => 'geonames', :featured => true),
                             gem(:name => 'ultrasphinx', :featured => true),
                             gem(:name => 'capistrano', :featured => true),
                             gem(:name => 'capistrano-ext'),
                             gem(:name => 'deprec'),
                             gem(:name => 'capistrano_colors'),
                             gem(:name => 'aws-s3'),
                             gem(:name => 'eventmachine'),
                             gem(:name => 'ebuilder'),
                             gem(:name => 'tlsmail'),
                             gem(:name => 'mysql2'),
                             gem(:name => 'mysqlplus'),
                             gem(:name => 'jQuery', :url => 'http://jquery.com', :featured => true),
                             gem(:name => 'HTML', :url => 'http://www.w3.org/TR/html4/cover.html#minitoc'),
                             gem(:name => 'Css', :url => 'http://www.w3.org/Style/Overview.html')
                         ]),
       OpenStruct.new(:id => 'adw', :name => 'Adwave.com, USA/CZ', :description => "AdWave is a free cross-promotional
                         and advertising network enabling developers,
                        advertisers and publishers to grow their social apps.",
                      :gems => [
                             gem(:name => 'sass', :featured => true),
                             gem(:name => 'jQuery', :url => 'http://jquery.com', :featured => true),
                             gem(:name => 'html', :url => 'http://www.w3.org/TR/html4/cover.html#minitoc', :featured => true)
                         ]),

       OpenStruct.new(id: 'cleaning_service', name: 'CleaningService (prototyping)',
                      description: 'Web app, Managing time and People. I created partially functional prototype (rails application without connection to database)', gems: [
           gem(:name => 'rails', :full_name => 'Ruby on Rails', :version => '3.2', :featured => true),
           gem(:name => 'sass', :featured => true),
           gem(name: 'twitter-bootstrap-rails', full_name: 'Twitter Bootstrap', version: '3.2', fatured: true),
       ]),
       OpenStruct.new(id: 'himalaya', name: 'Himalaya (eshop)',
                      description: 'I created SpreeCommerce eshop. Running on Heroku, and designed according customer preferences', gems: [
           gem(:name => 'rails', :full_name => 'Ruby on Rails', :version => '3.2', :featured => true),
           gem(:name => 'spree', full_name: 'SpreeCommerce', :featured => true),
           gem(name: 'twitter-bootstrap-rails', full_name: 'Twitter Bootstrap', version: '3.2', fatured: true),
       ]),

       OpenStruct.new(id: 'adeon', name: 'Teaching app (prototyping)',
                      description: 'Web app for learning and teaching. I created partially functional prototype (rails application without connection to database)', gems: [
           gem(:name => 'rails', :full_name => 'Ruby on Rails', :version => '3.2', :featured => true),
           gem(:name => 'sass', :featured => true),
           gem(name: 'twitter-bootstrap-rails', full_name: 'Twitter Bootstrap', version: '3.2', fatured: true),
       ]),

       OpenStruct.new(:id => 'dentservis', :name => 'Dentservis.cz, CZ', :description => "Contract management
                      for Dentist Laboratories. This is first stage prototyping (TwitterBootstrap) and design UI.
                      Some RubyOnRails setup DB and structure",
                      :gems => [
                             gem(:name => 'rails', :version => '3.2'),
                             gem(:name => 'pg', :full_name => 'PostgreSql'),
                             gem(:name => 'sassy_noise'),
                             gem(:name => 'sass-rails'),
                             gem(:name => 'less-rails-bootstrap'),
                             gem(:name => 'bootstrap-datepicker-rails'),
                             gem(:name => 'state_machine'),
                             gem(:name => 'will_paginate'),
                             gem(:name => 'inherited_resources'),
                             gem(:name => 'simple_form'),
                             gem(:name => 'erector'),
                             gem(:name => 'mini_record'),
                             gem(:name => 'meta_search'),
                             gem(:name => 'friendly_id'),
                             gem(:name => 'wicked_pdf'),
                             gem(:name => 'googlecharts'),
                             gem(:name => 'completeness-fu'),
                             gem(:name => 'delayed_job'),
                             gem(:name => 'delayed_job_active_record'),
                             gem(:name => 'factory_girl'),
                             gem(:name => 'simple_audit'),
                             gem(:name => 'devise'),
                             gem(:name => 'cancan'),
                             gem(:name => 'faker')
                         ]),

       OpenStruct.new(:id => 'ftuner', :name => 'Facetuner.com, USA/CZ', :description => 'Social application. I worked
                     as HTML/CSS webmaster',
                      :gems => [
                             gem(:name => 'jQuery', :url => 'http://jquery.com'),
                             gem(:name => 'HTML', :url => 'http://www.w3.org/TR/html4/cover.html#minitoc'),
                             gem(:name => 'sass')
                         ]),


       OpenStruct.new(:id => 'rgiant', :name => 'RebateGiant, USA/CZ',
                      :description => 'RebateGiant offers consumers money-saving services including cash back rebates,
                        discount coupons, special promotions and free shipping offers from top brand providers.',
                      :gems => [
                             gem(:name => 'jQuery', :url => 'http://jquery.com'),
                             gem(:name => 'HTML', :url => 'http://www.w3.org/TR/html4/cover.html#minitoc'),
                             gem(:name => 'sass')
                         ]),
       OpenStruct.new(:id => 'ovault', :name => 'OnlineVault.com, USA/CZ',
                      :description => 'small yet powerful application that automatically backs up all your important data to secure servers but also makes it possible for you to access it on the go!',
                      :gems => [
                          gem(:name => 'jQueryMobile'),
                          gem(:name => 'HTML', :url => 'http://www.w3.org/TR/html4/cover.html#minitoc'),
                          gem(:name => 'Css', :url => 'http://www.w3.org/Style/Overview.html')
                      ]),


       OpenStruct.new(:id => 'strelecdent', :name => 'StrelecDent.cz, CZ',
                      :description => 'Small presentation site for Dentist laboratory. Ruby on Rails',
                      :gems => [
                         gem(:name => 'rails', :version => '3.0.0'),
                         gem(:name => 'mysql2'),
                         gem(:name => 'compass'),
                         gem(:name => 'rails_admin'),
                         gem(:name => 'devise'),
                         gem(:name => 'i18n_routing'),
                         gem(:name => 'mini_record'),
                         gem(:name => 'will_paginate'),
                         gem(:name => 'magic_encoding'),
                         gem(:name => 'aws-s3'),
                         gem(:name => 'paperclip')                      ,
                     ]),

       OpenStruct.new(:id => 'strechy-ondrik', :name => 'Strechy-Ondrik.cz, CZ',
                      :description => 'Small presentation for an roofer guy. Padrino framework',
                      :gems => [
                          gem(:name => 'sinatra'),
                          gem(:name => 'padriono'),
                          gem(:name => 'less'),
                          gem(:name => 'sass'),
                          gem(:name => 'will_paginate'),
                          gem(:name => 'erubis'),
                          gem(:name => 'guard'),
                          gem(:name => 'html', :url => 'http://www.w3.org/TR/html4/cover.html#minitoc'),
                          gem(:name => 'jQuery', :url => 'http://jquery.com')
                      ]),
       OpenStruct.new(:id => 'pservis', :name => 'PohodovyServis.cz, CZ', :description => "Customer service
                    for electronics, PC etc. One place to deal with you service. I worked on whole application",
                      :gems => [
                          gem(:name => 'rails', :version => '3.2.3'),
                          gem(:name => 'mysql2'),
                          gem(:name => 'sass-rails'),
                          gem(:name => 'less-rails-bootstrap'),
                          gem(:name => 'bootstrap-datepicker-rails'),
                          gem(:name => 'simple_state_machine'),
                          gem(:name => 'will_paginate'),
                          gem(:name => 'inherited_resources'),
                          gem(:name => 'simple_form'),
                          gem(:name => 'erector'),
                          gem(:name => 'mini_record'),
                          gem(:name => 'meta_search'),
                          gem(:name => 'friendly_id'),
                          gem(:name => 'guard'),
                          gem(:name => 'factory_girl'),
                          gem(:name => 'rack-livereload'),
                          gem(:name => 'capistrano'),
                          gem(:name => 'jQuery', :url => 'http://jquery.com'),
                          gem(:name => 'HTML', :url => 'http://www.w3.org/TR/html4/cover.html#minitoc')
                      ])

      ]
    end


  end


end

