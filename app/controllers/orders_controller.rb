class OrdersController < ApplicationController
  before_action :set_item, only: [:create, :index]
  before_action :authenticate_user!, only: [:index]

  def index
    redirect_to root_path if current_user.id == @item.user_id || @item.order != nil
    @form = PayForm.new
  end

  def create
    @form = PayForm.new(order_params)
    if @form.valid?
      pay_item
      @form.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  def edit
  end

  def show

  end
    

  private

  def order_params
    params.require(:pay_form).permit(:postal_cord, :prefecture_id, :sity, :house_number, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end

end

