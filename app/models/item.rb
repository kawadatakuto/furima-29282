class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_area
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :delivery_time

  # アソシエーション
  belongs_to :user
  has_one :buy_item
  has_one_attached :image

  # 空の投稿を保存できないようにする
  validates :title, :text, :image, presence: true

  # ジャンルの選択が「--」の時は保存できないようにする
  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :genre_id, 
              :status_id, 
              :delivery_area_id, 
              :delivery_fee_id, 
              :delivery_time_id
  end

  # railsの初期設定のエラーメッセージが表示されているので設定する
  validates :genre_id, presence: { message: 'Category Select' }

  # 価格の範囲と半角数字のみ保存可能
  with_options presence: true, format: { with: /\A[0-9]+\z/, message: 'Price Half-width number' } do
    validates :selling_price, numericality: { only_integer: true, greater_than: 299, less_than: 9_999_999 }
  end
end
