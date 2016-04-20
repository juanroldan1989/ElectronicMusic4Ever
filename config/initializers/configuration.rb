# Maps environment variables into configuration settings

# Facebook Page
Rails.application.config.facebook_page_id    = Figaro.env.facebook_page_id
Rails.application.config.facebook_page_token = Figaro.env.facebook_page_token
