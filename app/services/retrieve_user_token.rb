require "koala"

class RetrieveUserToken

  def initialize
    @oauth = Koala::Facebook::OAuth.new(app_id, app_secret, callback_url)
  end

  def call
    # You can also get your application's own access token,
    # which can be used without a user session for subscriptions and certain other requests
    @oauth.get_app_access_token
  end

  private

  def app_id
    Rails.application.config.facebook_app_id
  end

  def app_secret
    Rails.application.config.facebook_app_secret
  end

  def callback_url
    callback_url = "/callback"
  end
end
