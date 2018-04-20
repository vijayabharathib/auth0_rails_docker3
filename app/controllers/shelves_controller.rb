class ShelvesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_shelf, only: [:show, :edit, :update, :destroy]

  def new
    @shelf = Shelf.new
    @books=Book.all
  end

  def create
    @shelf=Shelf.find_or_create_by(
      user_id: current_user.id, 
      book_id: shelf_params[:book_id]
    )
    @shelf.place=shelf_params[:place]
    if @shelf.save
      redirect_to @shelf.book
    else
      render :new 
    end
  end

  def update
      @shelf.update(shelf_params)
      redirect_to @shelf.book
  end

  private

    def set_shelf
      @shelf = Shelf.find(params[:id])
    end
    def shelf_params
      params.require(:shelf).permit(:place, :book_id)
    end
end
