class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.all
  end

  def show
    @current_shelf=@book.shelves.by_user(current_user)
    if @current_shelf.blank?
      @shelf=Shelf.new
      @place=""
    else 
      @shelf=@current_shelf
      @place=@shelf.place
    end 
  end

  def new
    @book = Book.new
  end

  def edit
  end

  def create
    logger.debug params
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end


  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
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
