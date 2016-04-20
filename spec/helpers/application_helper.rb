require "rails_helper"

RSpec.describe ApplicationHelper do
  # 'helper' is an instance of ActionView::Base configured with the
  # EventsHelper and all of Rails' built-in helpers

  describe "#news_image_link" do
    describe "displays a link for the 'News' item" do
      it "should link to an image for 'photo' items" do
        post =
          PostWrapper.new({
            "name" => "Giuseppe Ottaviani",
            "type" => "photo",
            "link" => "link_to_photo"
          })
        expect(helper.news_image_link(post)).to eq "<a href=\"link_to_photo\" target=\"_blank\"><img src=\"\" /></a>"
      end

      it "should link to Youtube for 'video' items" do
        post =
          PostWrapper.new({
            "name" => "Tiesto",
            "type" => "video",
            "link" => "link_to_video"
          })
        expect(helper.news_image_link(post)).to eq "<a href=\"link_to_video\" target=\"_blank\"><img src=\"\" /></a>"
      end
    end
  end

end
