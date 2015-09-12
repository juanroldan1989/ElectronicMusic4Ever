class PageGraph

  def initialize(page_token)
    @page_graph = Koala::Facebook::API.new(page_token)
  end

  def posts
    # the page's wall
    @page_graph.get_connection("me", "feed")
  end
end


# client.get_connection('someuser', 'posts',
#                     {limit: @options[:max_items],
#                       fields: ['message', 'id', 'from', 'type',
#                                 'picture', 'link', 'created_time', 'updated_time'
#                         ]})

# Note: You can pass a ‘type’ hash key with a value of ‘small’, ‘normal’, ‘large’, or ‘square’ to obtain different picture sizes, with the default being ‘square’. Also, you may need the user_photos permission.
