class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    @books = Book.all
    if @book.save(book_params)
      redirect_to book_path(@book.id),notice:'You have created book successfully!'
    else
      render :index
    end
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id),notice:'You have updated book successfully!'
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy(book_params)
    redirect_to books_path
  end


  private
  def book_params
    params.require(:book).permit(:title,:body)
  end

end
