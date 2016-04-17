class PageGraph

  PAGE_ID = "231320383554518".freeze

  attr_reader :graph

  def initialize
    @graph = Koala::Facebook::API.new(page_token)
  end

  # Graph API explorer query: 231320383554518/feed?fields=name,type,link,picture,created_time
  def posts
    @graph.get_connections(PAGE_ID, "feed",
      {
        "limit"  => "50",
        "fields" => ["name", "type", "link", "picture", "created_time"]
      }
    )
  end

  # Graph API explorer query: 231320383554518/albums?fields=name,link,photos{images}
  def albums
    @graph.get_connections(PAGE_ID, "albums",
      {
        "limit"  => "10",
        "fields" => ["name", "link", "photos{images}"]
      }
    )
  end

  private

  # https://developers.facebook.com/tools/accesstoken/
  def page_token
    Rails.application.config.facebook_page_token
  end
end
