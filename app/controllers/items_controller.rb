class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit]
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
  end

  def edit
    @item = Item.find(params[:id])
    if user_signed_in? && current_user.id == @item.user_id
    else
       render 'show'
    end
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.valid?
      redirect_to item_path
    else
      render 'edit'
    end
  end

  private  # private以下の記述はすべてプライベートメソッドになる

  # 画像の保存を許可する記述
  def item_params
    params.require(:item).permit(:title, :text, :image, :genre_id, :status_id, :delivery_fee_id, :delivery_area_id, :delivery_time_id, :selling_price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to user_session_path unless user_signed_in?
  end
end
