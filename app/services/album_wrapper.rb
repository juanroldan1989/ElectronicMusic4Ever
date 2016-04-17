class AlbumWrapper

  attr_reader :album
  attr_reader :link
  attr_reader :title

  def initialize(album)
    @album = album
    @title = album["name"]
    @link  = album["link"]
  end

  def cover_photo
    photos.any? ? photos.first : "http://"
  end

  def photos
    any_photos? ? format_photos : []
  end

  def to_partial_path
    "/shared/album"
  end

  private

  def any_photos?
    album["photos"].present? && album["photos"]["data"].any?
  end

  def find_best_image(image_with_sizes)
    image = image_with_sizes.find { |image| image["height"] < 600 }

    image.present? ? image["source"] : "http://"
  end

  def format_photos
    images_with_sizes = album["photos"]["data"]

    images_with_sizes.collect { |image_with_sizes|

      find_best_image(image_with_sizes["images"])

    }.compact
  end
end

# {"name"=>"Timeline Photos",
#   "photos"=>{"data"=>[
#     {"images"=>[
#       {"height"=>720,
#         "source"=>"https://scontent.xx.fbcdn.net/hphotos-xpf1/v/t1.0-9/12963404_1156905534329327_3839171692819207812_n.jpg?oh=bad99659f5a76ab738649b74fa400525&oe=57B13CFF",
#         "width"=>508},

#       {"height"=>680,
#         "source"=>"https://fbcdn-photos-d-a.akamaihd.net/hphotos-ak-xpf1/v/t1.0-0/p480x480/12963404_1156905534329327_3839171692819207812_n.jpg?oh=33101515979d5baa2269194a35201cfe&oe=57AD72E4&__gda__=1467526991_c949c35b42cd18d7f6df0a17f5a55e65",
#         "width"=>480},

#       {"height"=>453,
#         "source"=>"https://fbcdn-photos-d-a.akamaihd.net/hphotos-ak-xpf1/v/t1.0-0/p320x320/12963404_1156905534329327_3839171692819207812_n.jpg?oh=4267497a429b790fc9fd70169f20cff3&oe=57B9E8A3&__gda__=1467166216_ab70733deafc7a0adf82a1ae9b5b4cc5",
#         "width"=>320},

#       {"height"=>540,
#         "source"=>"https://fbcdn-photos-d-a.akamaihd.net/hphotos-ak-xpf1/v/t1.0-0/p180x540/12963404_1156905534329327_3839171692819207812_n.jpg?oh=7985650d70d72ddbf2b27638678643ad&oe=57BDCEE8&__gda__=1467845187_b66363315fccb2df4a584b855b5595fc",
#         "width"=>381},
