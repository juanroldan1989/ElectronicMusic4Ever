class NewsController < ApplicationController

  helper_method :collection

  def index

  end

  def callback

  end

  private

  def collection
    @collection ||= RetrieveNews.new.results
  end
end
