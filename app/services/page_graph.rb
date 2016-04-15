class PageGraph

  PAGE_ID = "231320383554518".freeze

  attr_reader :graph

  def initialize
    @graph = Koala::Facebook::API.new(page_token)
  end

  def posts
    @graph.get_connections(PAGE_ID, "feed",
      {
        "limit"  => "50",
        "fields" => ["name", "type", "link", "picture", "created_time"]
      }
    )
  end

  private

  # https://developers.facebook.com/tools/accesstoken/
  def page_token
    Rails.application.config.facebook_page_token
  end
end

# # http://graph.facebook.com/contextoptional/feed
# client = Koala::Facebook::API.new(oauth_token)
# client.get_connection('someuser', 'posts',
#                     {limit: @options[:max_items],
#                       fields: ['message', 'id', 'from', 'type',
#                                 'picture', 'link', 'created_time', 'updated_time'
#                         ]})
