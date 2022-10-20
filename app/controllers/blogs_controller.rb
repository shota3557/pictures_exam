class BlogsController < ApplicationController
  before_action :barrier_user, only: [:edit, :destroy]
  def index
    @blogs = Blog.all
  end

  def show
    @blog = Blog.find(params[:id])
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
  end

  def new
    if params[:back]
      @blog = Blog.new(blog_params)
    else
      @blog = Blog.new  
    end
  end

  def confirm
    @blog = current_user.blogs.build(blog_params)
    render :new if @blog.invalid?
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def create
    @blog = current_user.blogs.build(blog_params)
    if @blog.save
      ContactMailer.contact_mail(@blog).deliver
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

    def barrier_user
      unless Blog.find_by(id: params[:id]).user_id == current_user.id
        flash[:notice] = "あなたは編集できません"
        redirect_to blogs_path
      end
    end
end