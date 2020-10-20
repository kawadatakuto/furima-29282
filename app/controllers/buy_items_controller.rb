class BuyItemsController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index,
  
  def index
    @delivery_address = DeliveryAddress.new
    @order_form = OrderForm.new
    if current_user.id == @item.user_id || @item.buy_item != nil
       redirect_to root_path
    end
  end

  def create
    @order_form = OrderForm.new(order_form_params)
    
    if @order_form.valid?
      pay_item
      @order_form.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_form_params
    params.permit(:postal_code, :prefecture, :munisicipality, :address, :building_name, :phone_number, :token, :item_id, :user_id).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.selling_price,  # 商品の値段
      card: order_form_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    redirect_to user_session_path unless user_signed_in?
  end

end
