class PageGraph

  def initialize(page_token)
    @page_graph = Koala::Facebook::API.new(page_token)
  end

  def posts
    # the page's wall
    @page_graph.get_connection("me", "feed")
  end
end
