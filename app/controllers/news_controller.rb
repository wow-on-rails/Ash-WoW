class NewsController < ApplicationController
  def index
  	@news = News.all().order("id DESC")
  end
end
