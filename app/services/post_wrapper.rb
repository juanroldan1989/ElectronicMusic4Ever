class PostWrapper

  attr_reader :title
  attr_reader :post_type
  attr_reader :facebook_link
  attr_reader :video_url
  attr_reader :image_url

  def initialize(title, post_type, facebook_link, video_url, image_url)
    @title         = title
    @post_type     = post_type
    @facebook_link = facebook_link
    @video_url     = video_url
    @image_url     = image_url
  end

  def self.build_from(post)
    new(post["message"], "post_type", get_facebook_link, post["link"], post["picture"])
  end

  private

  def get_facebook_link(post)
    if post["actions"].any?
      if post["actions"].first.present?
        post["actions"].first["link"]
      else
        ""
    else
      ""
    end
  end
end

# post example:
# {"id"=>"231320383554518_1037325506287331",
#  "from"=>{"name"=>"Electronic Music 4 Ever", "category"=>"Music Video", "id"=>"231320383554518"}, 
#  "to"=>  {"data"=>[{"name"=>"Paul Van Dyk", "category"=>"Musician/Band", "id"=>"21180459592"}]},
#  "message"=>"Paul Van Dyk 's \"Reflections\" album\n\nhttps://www.youtube.com/watch?v=8MxeOlJcekc", 
#     "message_tags"=>{"0"=>[{"id"=>"21180459592", "name"=>"Paul Van Dyk", "type"=>"page", "offset"=>0,
#                             "length"=>12}]},
#     "picture"=>"https://fbexternal-a.akamaihd.net/safe_image.php?d=AQCX01y18MLpDdbI&w=130&h=130&url=http%3A%2F%2Fi.ytimg.com%2Fvi%2F8MxeOlJcekc%2Fmaxresdefault.jpg&cfs=1&sx=385&sy=0&sw=720&sh=720",
#     "link"    =>"https://www.youtube.com/watch?v=8MxeOlJcekc",
#     "source"=>"https://www.youtube.com/embed/8MxeOlJcekc?autoplay=1",
#     "name"=>"Paul van Dyk - Reflections (Full Album)",
#     "caption"=>"youtube.com",
#     "description"=>"https://itunes.apple.com/us/album/reflections/id853555448 01. Paul van Dyk - Crush 0:00 02. Paul van Dyk - Time Of Our Lives 7:46 03. Paul van Dyk - Like A F...",
#     "icon"=>"https://www.facebook.com/images/icons/post.gif",
#     "actions"=>[{"name"=>"Comment",
#                  "link"=>"https://www.facebook.com/231320383554518/posts/1037325506287331"},
#                  {"name"=>"Like", "link"=>"https://www.facebook.com/231320383554518/posts/1037325506287331"}],
#     "privacy"=>{"value"=>"EVERYONE", "description"=>"Public", "friends"=>"", "allow"=>"", "deny"=>""},
#     "type"=>"video", "status_type"=>"shared_story", "created_time"=>"2015-09-12T00:36:56+0000",
#     "updated_time"=>"2015-09-12T00:36:56+0000",
#     "is_hidden"=>false,
#     "subscribed"=>true,
#     "is_expired"=>false
#   }
