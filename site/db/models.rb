require 'active_record'
require 'mini_record'

configure :development do
  ActiveRecord::Base.establish_connection(
      :adapter => "sqlite3",
      :database => "portfolio.db"
  )
end

class Post < ActiveRecord::Base
  field :title, :type => :string
  field :body, :type => :text
  field :position, :type => :integer
end