

namespace :site do

  task :environment do
    require "rack/test"
    require 'sinatra_static'
    require File.join(File.dirname(File.expand_path(__FILE__)), 'app')
  end

  task :setup => :environment do
    puts '*'*50
    puts 'SETUP FOLDERS'
    $path = File.join(Portfolio.root, Portfolio.settings.static_site)
    mkdir_p($path)
    puts '*'*50
  end

  task :build => :setup do
    builder = SinatraStatic.new(Portfolio)
    builder.build!($path)
    puts 'FILES GENERATED IN FOLDER'
    puts $path.to_s
  end

  task :seed do
    puts ''
    puts '*'*50
    puts 'SEED DATA'
    Portfolio::Post.auto_upgrade!
    Portfolio::Post.where(:title => 'First post2', :position => 1).first_or_create
    puts '*'*50
  end

end

task :start do
   `bundle exec rackup config.ru`
end

task :run => :start do

end