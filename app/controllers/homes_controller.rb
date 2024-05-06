class HomesController < ApplicationController
  def destroy
    reset_session
    flash[:notice]="Signed out successfully."
    redirect_to root_path
  end
end
