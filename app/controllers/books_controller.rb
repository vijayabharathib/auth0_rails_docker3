class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.all
  end

  def index
    if(params[:place].nil?)
      @books=Book.all
    else 
      @books=Book.within_shelf(params[:place],current_user)
    end
  end

  def show
    current_shelf=@book.shelves.by_user(current_user).first
    if current_shelf.blank?
      @shelf=Shelf.new
      @place=""
    else 
      @shelf=current_shelf
      @place=@shelf.place
    end 
    logger.debug @shelf.inspect
  end

  def new
    @book = Book.new
  end

  def edit
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book
    else
      render :new
    end
  end

  def update
      if @book.update(book_params)
        redirect_to @book
      else
        render :edit
      end
  end


  def destroy
    @book.destroy
    redirect_to books_url
  end

  private
    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:name, :author)
    end
end
