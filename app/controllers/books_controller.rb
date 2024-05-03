class BooksController < ApplicationController
  
  def index
    @user_new=User.new
    @books=Book.all
  end
  
  def create
    @book=Book.new(book_params)
    if @book.
      flash[:notice]="You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :new
    end
  end
  
  def show
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
    params.require(:book).permit(:title, :body, :image)
  end
end
