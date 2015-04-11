class NewsController < ApplicationController

  def index
  	@news = News.all().order("id DESC")
  end

  def view
  	@post = News.find_by(id: params[:id])

  	if(@post.blank?) 
  		redirect_to root_path
	end
  end

end
