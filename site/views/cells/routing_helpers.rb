module RoutingHelpers
  def post_path(model, *args)
    "/post/#{model.id}"
  end
end