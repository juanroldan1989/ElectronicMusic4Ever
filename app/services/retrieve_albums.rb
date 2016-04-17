class RetrieveAlbums

  def results
    @results ||=
      page_graph.albums.collect { |album| AlbumWrapper.new(album) }
  end

  private

  def page_graph
    @page_graph ||= PageGraph.new
  end
end
