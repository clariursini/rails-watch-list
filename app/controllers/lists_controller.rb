class ListsController < ApplicationController
  before_action :set_list, only: [:show]
  def index
    @lists = List.all
    @list = List.new
  end

  def show
    @bookmark = Bookmark.new
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      # render :index, status: :unprocessable_entity
      redirect_to lists_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy

    redirect_to lists_path, status: :see_other
  end

  private

  def list_params
    params.require(:list).permit(:name, :picture, :photo)
  end

  def set_list
    @list = List.find(params[:id])
  end
end
