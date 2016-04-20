require "rails_helper"

RSpec.describe PageGraph do
  before(:each) do
    @page_graph = PageGraph.new
  end

  describe "#albums" do
    it "should return photos from FacebookPage's albums" do
      VCR.use_cassette("albums") do
        albums = @page_graph.albums

        album = albums.first

        # album's data
        expect(album["name"]).to eq "Timeline Photos"
        expect(album["link"]).to eq "https:\/\/www.facebook.com\/album.php?fbid=324354720917750&id=231320383554518&aid=82443"

        # album's first photo
        photos = album["photos"]["data"].first["images"]
        photo  = photos.first

        expect(photo["height"]).to eq 720
        expect(photo["source"]).to eq "https://scontent.xx.fbcdn.net/v/t1.0-9/12963404_1156905534329327_3839171692819207812_n.jpg?oh=bad99659f5a76ab738649b74fa400525&oe=57B13CFF"
        expect(photo["width"]).to eq  508
      end
    end
  end

  describe "#posts" do
    it "should return posts (photos and videos) from FacebookPage's wall" do
      VCR.use_cassette("posts") do
        posts = @page_graph.posts

        first_post  = posts.first
        second_post = posts.second

        expect(first_post["id"]).to eq            "231320383554518_1157997177553496"
        expect(first_post["name"]).to eq          "Giuseppe Ottaviani"
        expect(first_post["type"]).to eq          "photo"
        expect(first_post["link"]).to eq          "https:\/\/www.facebook.com\/giuseppeottaviani\/photos\/a.275506899503.136018.36247099503\/10153905794669504\/?type=3"
        expect(first_post["picture"]).to eq       "https:\/\/fbcdn-photos-c-a.akamaihd.net\/hphotos-ak-xpa1\/v\/t1.0-0\/p130x130\/12963655_10153905794669504_5453722727759964637_n.jpg?oh=9250b3a72cba562686971fc50ec4819a&oe=5771D31A&__gda__=1470961893_85f7e617fb627ef7a2d2847ef1ed7376"
        expect(first_post["created_time"]).to eq  "2016-04-17T04:15:14+0000"

        expect(second_post["id"]).to eq           "231320383554518_1157461014273779"
        expect(second_post["name"]).to eq         "Coachella 2016 Live Webcast Channel 3"
        expect(second_post["type"]).to eq         "video"
        expect(second_post["link"]).to eq         "https:\/\/www.youtube.com\/watch?v=xhMmH0AFwLc"
        expect(second_post["picture"]).to eq      "https:\/\/fbexternal-a.akamaihd.net\/safe_image.php?d=AQDq4fw0DRSaofzT&w=130&h=130&url=https\u00253A\u00252F\u00252Fi.ytimg.com\u00252Fvi\u00252FxhMmH0AFwLc\u00252Fmaxresdefault_live.jpg&cfs=1"
        expect(second_post["created_time"]).to eq "2016-04-16T06:05:25+0000"
      end
    end
  end
end
