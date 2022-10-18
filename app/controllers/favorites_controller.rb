class FavoritesController < ApplicationController

  def index

  end

  def show
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
  end

  def new

  end

  def edit
  end

  def create
  
  end

  def update
   
  end

  def destroy
 
  end

  private
    def favorite_params
      params.require(:favorite).permit(:user_id, :blog_id)
    end
end
