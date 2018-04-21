class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :new, :create]
  before_action :set_book, only: [:show]

  def index
    if(params[:place].nil?)
      @books=Book.all
    else 
      @books=Book.within_shelf(
        params[:place],
        current_user)
    end
  end

  def show
    current_shelf=@book.shelves.by_user(current_user).first
    if current_shelf.blank?
      @shelf=Shelf.new
    else 
      @shelf=current_shelf
    end 
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book
    else
      render :new
    end
  end

  private
    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:name, :author)
    end
end
