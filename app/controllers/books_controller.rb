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
    @books=Book.all
    @book=Book.find(params[:id])
  end

  def destroy
    book=Book.find(params[:id])
    book.delete
    redirect_to books_path
  end

  def edit
    @book=Book.find(params[:id])
    if @book.user.id != current_user.id
      redirect_to books_path
    end
  end

  def update
    @book=Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice]="You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body,)
  end
end
