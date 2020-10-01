class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_area
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :delivery_time

  #imageカラムのアソシエーション
  has_one_attached :image

  #空の投稿を保存できないようにする
  validates :title, :text, :image, :selling_price, presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :genre_id, :status_id, :delivery_area_id, :delivery_fee_id, :delivery_time_id, numericality: { other_than: 1 } 

  #価格の範囲と半角数字のみ保存可能
  with_options presence: true, format: { with: /\A[0-9]+\z/, message: "Price Half_width number" } do 
    validates :selling_price, numericality: { only_integer:true, greater_than: 299, less_than: 10000000 }
  end

end
