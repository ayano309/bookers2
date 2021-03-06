class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @user = current_user
    @users = User.all
    @book = Book.new
    @books = Book.all
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book =Book.new
  end

  def edit
    @user = User.find(params[:id])
    if current_user != @user
       redirect_to user_path(current_user.id)
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'You have updated user successfully.'
    else
      render :edit
    end
  
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
    
  end
  
end

