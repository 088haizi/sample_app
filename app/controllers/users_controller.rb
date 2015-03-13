class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample app"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def show
    @user = User.find(params[:id])
  end

  private #对私有方法刻意多一层缩进
  
    def user_params
      params.require(:user).permit(:name,:email,:password,
                                   :password_confirmation)
    end
end