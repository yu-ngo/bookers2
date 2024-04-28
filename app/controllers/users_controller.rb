class UsersController < ApplicationController
  
  def show
    @user_new=User.new
    @user=User.find(params[:id])
    @users=User.all
    @book=@user.book
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    user=User.find(params[:id])
    user.update(user_params)
    redirect_to user_path(user.id)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
 end
