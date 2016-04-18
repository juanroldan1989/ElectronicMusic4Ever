module ApplicationHelper

  def news_image_link(news_item)
    resource_url = news_item.is_video? ? news_item.video_url : news_item.facebook_link

    link_to image_tag(news_item.image_url), resource_url, target: "_blank"
  end
end
