class RetrieveNews

  def results
    @results ||= page_graph.posts.collect { |post| PostWrapper.new(post) }
  end

  private

  def page_graph
    @page_graph ||= PageGraph.new
  end
end
