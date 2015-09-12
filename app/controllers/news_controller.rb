class NewsController < ApplicationController

  helper_method :collection

  def index
  end

  private

  def collection
    @collection ||= RetrieveNews.new.results
  end
end
