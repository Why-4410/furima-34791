class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.order("id")
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.save
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :product_text, :category_id, :condition_id, :delivery_fee_id, :prefecture_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end
end