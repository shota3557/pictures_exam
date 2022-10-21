class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if params[:back]
      render :new
    else  
      if @user.save
        redirect_to users_path    
      else
        render :new
      end
    end  
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path(user_params)
    else
      render :edit  
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image)
  end
end
