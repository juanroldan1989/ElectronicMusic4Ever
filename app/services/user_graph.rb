class UserGraph

  def initialize(user_token)
    @user_graph = Koala::Facebook::API.new(user_token)
  end

  def pages
    # retrieve collection fo all your managed pages:
    # returns collection of hashes with page id, name, category, access token and permissions
    @pages ||= @user_graph.get_connections("me", "accounts")
  end

  def page_token(page_id)
    # or: retrieve access_token for a given page_id
    @page_token ||= @user_graph.get_page_access_token(page_id)
  end
end
