class UserGraph < Struct.new(:user_access_token)

  def call
    @user_graph = Koala::Facebook::API.new(user_access_token)
  end

  def pages
    # retrieve collection fo all your managed pages: returns collection of hashes with page id, name, category, access token and permissions
    pages = @user_graph.get_connections('me', 'accounts')
    # get access token for first page
    first_page_token = pages.first['access_token']
  end

  def page_token(page_id)
    # or: retrieve access_token for a given page_id
    page_token = @user_graph.get_page_access_token(page_id)
  end
end
