class UsersController < ApplicationController
  
  def index
    @user = User.new
    @users = User.all
  end
  
  def create
    user = User.new(user_params)
    user.save
    redirect_to '/books'
  end
  
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :introduction)
  end
  
end
