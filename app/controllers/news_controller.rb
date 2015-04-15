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

  def edit
  	if current_user && current_user.access.gmlevel > Settings.roles[:edit_post]
  		@post = News.find_by(id: params[:id])

	  	if @post.blank?
	  		redirect_to root_path
		end
	else
  		redirect_to root_path
	end
  end

  def new
  	@post = News.new()
  end

  def create
  	@post = News.new(post_params)

  	if @post.save
  		flash.now[:success] = "Post created successfully"
	else
		flash.now[:error] = "Please, check your data"
	end
		render 'new'
  end

  def update
	@post = News.find(params[:id])

  	if @post.update(post_params)
		redirect_to view_path(@post)
	else
		render 'edit'
	end
  end

  private

  def post_params
	params.require(:post).permit(:title, :content)
  end

end
