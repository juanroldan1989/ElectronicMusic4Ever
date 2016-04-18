require "rails_helper"

RSpec.describe HomeController do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET #about" do
    it "responds successfully with an HTTP 200 status code" do
      get :about
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the about template" do
      get :about
      expect(response).to render_template("about")
    end
  end

  describe "GET #news" do
    it "responds successfully with an HTTP 200 status code" do
      get :news
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the news template" do
      get :news
      expect(response).to render_template("news")
    end
  end

  describe "GET #gallery" do
    it "responds successfully with an HTTP 200 status code" do
      get :gallery
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the gallery template" do
      get :gallery
      expect(response).to render_template("gallery")
    end
  end

  describe "GET #contact" do
    it "responds successfully with an HTTP 200 status code" do
      get :contact
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the contact template" do
      get :contact
      expect(response).to render_template("contact")
    end
  end
end
