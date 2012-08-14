# CELL
#require 'cells'
require 'cell/base'
require "cell/rails/helper_api"
require "simple_form"
require  File.join(File.dirname(File.expand_path(__FILE__)), 'routing_helpers')

class PostsCell < Cell::Base
  include Cell::Rails::HelperAPI

  self._helpers = RoutingHelpers

  def show
    # c
    @post= Post.last
    render :'show.html'
  end
end