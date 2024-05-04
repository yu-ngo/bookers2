class BooksController < ApplicationController

  def index
    @book_new=Book.new
    @books=Book.all
  end

  def create
    @book_new=Book.new(book_params)
    @book_new.user_id = current_user.id
    if @book_new.save
      flash[:notice]="You have updated book successfully."
      redirect_to book_path(@book_new.id)
    else
      @books=Book.all
      render :index
    end
  end

  def show
    @book_new=Book.new
    @book=Book.find(params[:id])
    @user=User.find(params[:id])
  end

  def destroy
    book=Book.find(params[:id])
    book.destroy
    redirect_to 'books_path'
  end

  def edit
    @book=Book.find(params[:id])
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
