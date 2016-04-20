class PageGraph

  attr_reader :graph

  def initialize
    @graph = Koala::Facebook::API.new(page_token)
  end

  # Graph API explorer query: page_id/feed?fields=name,type,link,picture,created_time
  def posts
    @graph.get_connections(page_id, "feed",
      {
        "limit"  => "50",
        "fields" => ["name", "type", "link", "picture", "created_time"]
      }
    )
  end

  # Graph API explorer query: page_id/albums?fields=name,link,photos{images}
  def albums
    @graph.get_connections(page_id, "albums",
      {
        "limit"  => "10",
        "fields" => ["name", "link", "photos{images}"]
      }
    )
  end

  private

  def page_id
    Rails.application.config.facebook_page_id
  end

  # https://developers.facebook.com/tools/accesstoken/
  def page_token
    Rails.application.config.facebook_page_token
  end
end
