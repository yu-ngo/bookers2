class UsersController < ApplicationController

  def show
    @book_new=Book.new
    @user=User.find(params[:id])
    @books=@user.books#特定のユーザーのbook情報を一覧で表示する。
  end

  def create
    @user=User.new(user_params)
    if @user.save
      flash[:notice]="Welcome! You have signde up successfully."
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def index
    @book_new=Book.new
    @users=User.all
  end

  def edit
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user=User.find(params[:id])
   if @user.update(user_params)
    flash[:notice]="You have updated book successfully."
    redirect_to user_path(@user.id)
   else
    render :edit
   end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

 end
