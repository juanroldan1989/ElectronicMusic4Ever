class RetrieveNews
  PAGE_ID = "12" # ID TranceForEver Facebook's Page

  def results
    page_graph.wall # inspect
  end

  private

  def page_graph
    @page_graph ||= PageGraph.new(page_token)
  end

  def page_token
    @page_token ||= @user_graph.page_token(PAGE_ID)
  end

  def setup_graph
    @user_graph ||= UserGraph.new(RetrieveUserToken.new.call)
  end
end


# https://github.com/arsduo/koala/wiki/Acting-as-a-Page
