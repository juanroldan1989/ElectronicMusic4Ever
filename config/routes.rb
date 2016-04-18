Rails.application.routes.draw do
  get "/about"    => "home#about"
  get "/news"     => "home#news"
  get "/gallery"  => "home#gallery"
  get "/contact"  => "home#contact"
  root :to        => "home#index"
end
