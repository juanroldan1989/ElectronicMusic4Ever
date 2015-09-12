class RetrieveNews
  PAGE_ID = "231320383554518".freeze # ID TranceForEver Facebook's Page

  def results
    collection
  end

  private

  def collection
    @collection ||= page_graph.wall.collect { |post| PostWrapper.build_from(post) }
  end

  def page_graph
    @page_graph ||= PageGraph.new(page_token)
  end

  def page_token
    @page_token ||= user_graph.page_token(PAGE_ID)
  end

  def user_graph
    @user_graph ||= UserGraph.new(RetrieveUserToken.new.call)
  end
end


# https://github.com/arsduo/koala/wiki/Acting-as-a-Page
