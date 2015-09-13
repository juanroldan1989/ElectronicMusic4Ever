ElectronicMusicRails::Application.routes.draw do
  get "/about"    => "home#about"
  get "/news"     => "news#index"
  get "/gallery"  => "home#gallery"
  get "/contact"  => "home#contact"
  get "/callback" => "news#callback"
  root :to        => "home#index"
end
