class ItemsController < ApplicationController

  before_action :move_to_index, except: [:index, :show]
  
  def index
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

  private  # private以下の記述はすべてプライベートメソッドになる

  #画像の保存を許可する記述
  def item_params
    params.require(:item).permit( :title,:text, :image, :genre_id, :status_id, :delivery_fee_id, :delivery_area_id, :delivery_time_id, :selling_price).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to user_session_path
    end
  end

end
