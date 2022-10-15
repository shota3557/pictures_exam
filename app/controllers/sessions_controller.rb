class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:sessions][:email].downcase
    if user && user.authenticate(params[:session][:password]) #authenticateはパスワードが一致してるか判定するメソッド
    
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end  
  end
end
