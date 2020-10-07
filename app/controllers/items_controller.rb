class ItemsController < ApplicationController
  before_action :set_item, only: [:show]
  before_action :move_to_index, except: [:index, :show]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private  # private以下の記述はすべてプライベートメソッドになる

  # 画像の保存を許可する記述
  def item_params
    params.require(:item).permit(:title, :text, :image, :genre_id, :status_id, :delivery_fee_id, :delivery_area_id, :delivery_time_id, :selling_price).merge(user_id: current_user.id)
  end

  def set_item
    @items = Item.find(params[:id])
  end

  def move_to_index
    redirect_to user_session_path unless user_signed_in?
  end
end
