class PostWrapper

  attr_reader :title
  attr_reader :post_type
  attr_reader :facebook_link
  attr_reader :video_url
  attr_reader :image_url
  attr_reader :created_at

  def initialize(post)
    @title         = post["name"]
    @post_type     = post["type"]
    @facebook_link = post["link"]
    @video_url     = post["link"]
    @image_url     = post["picture"]
    @created_at    = post["created_time"]
  end

  def is_video?
    @post_type == "video"
  end

  def to_partial_path
    "/shared/news_item"
  end
end
