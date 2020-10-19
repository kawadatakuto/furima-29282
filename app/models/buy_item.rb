class BuyItem < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  # アソシエーション
  belongs_to :item
  belongs_to :user
  has_one :delivery_address

end
