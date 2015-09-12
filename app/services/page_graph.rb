class PageGraph < Struct.new(:page_token)

  def call
    @page_graph = Koala::Facebook::API.new(page_token)
  end

  def wall
    @page_graph.get_connection('me', 'feed') # the page's wall
  end
end
