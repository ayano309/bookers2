class BooksController < ApplicationController
  before_action :authenticate_user!
  def index
    @books = Book.all
    @book = current_user.books.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    
  end

  def create
    @book = current_user.books.new(book_params)
    if @book.save
      redirect_to book_path(@book), notice: 'Book was successfully created'
    else
      @books = Book.all
      render :index
    end
  end


  def edit
    @book=current_user.books.find(params[:id])
  end

  def update
    @book=current_user.books.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def destroy
    book=current_user.books.find(params[:id])
    book.destroy!
    redirect_to books_path,notice: "Book was successfully destroyed."
  end

  

  private
    def book_params
      params.require(:book).permit(:title, :body)
    end
end
