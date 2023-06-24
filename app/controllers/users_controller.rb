class UsersController < ApplicationController
  
  def index
    @users = User.all
  end
  
  def create
    user = User.new(user_params)
    user.save
    redirect_to '/books'
  end
  
  def show
    @user = current_user
    @books = @user.books
  end

  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end
  
end
