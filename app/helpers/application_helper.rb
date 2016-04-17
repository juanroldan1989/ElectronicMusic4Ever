module ApplicationHelper

  def post_image_link(news_item)
    resource_url = news_item.post_type == "video" ? news_item.video_url : news_item.image_url

    link_to image_tag(news_item.image_url), resource_url, target: "_blank"
  end
end
