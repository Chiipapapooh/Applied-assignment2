class BooksController < ApplicationController
  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @book_new = Book.new
  end

  def index
    @books = Book.all
    @book_new = Book.new
    @user = current_user
  end

  def create
    @book_new = Book.new(book_params)
    @books = Book.all
    @book_new.user_id = current_user.id
    if @book_new.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book_new.id)
    else
      @user = current_user
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user != current_user
      redirect_to books_path
    end 
  end

  def update
    @book = Book.find(params[:id])
    @user = current_user
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id) 
    else
      render :edit
    end
    if @book.user != current_user
      redirect_to books_path
    end 
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to '/books'
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
