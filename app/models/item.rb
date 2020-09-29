class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_area
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :delivery_time

  #空の投稿を保存できないようにする
  validates :genre_id, :status_id, :delivery_area_id, :delivery_fee_id, :delivery_time_id, presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :genre_id, :status_id, :delivery_area_id, :delivery_fee_id, :delivery_time_id, numericality: { other_than: 1 } 
end
