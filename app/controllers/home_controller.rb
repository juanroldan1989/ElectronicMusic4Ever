class HomeController < ApplicationController
  helper_method :news

  def index
  end

  def about
  end

  def news
  end

  def gallery
  end

  def contact
  end

  private

  def news
    @news ||= RetrieveNews.new.results
  end
end
