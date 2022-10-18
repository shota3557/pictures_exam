class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def new
    @blog = Blog.new
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def create
    @blog = current_user.blogs.build(blog_params)
    # @blog = Blog.new(blog_params)
    # @blog.user_id = current_user.id
    if @blog.save
      redirect_to blogs_path
    end
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to blogs_path
    else
      render :edit   
    end  
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path
  end

  private
    def blog_params
      params.require(:blog).permit(:content, :image, :image_cache)
    end
end
