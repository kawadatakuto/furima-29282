class OrderForm
  include ActiveModel::Model

  attr_accessor :postal_code, :prefecture, :address, :building_name, :phone_number, :munisicipality, :token, :item_id, :user_id
  validates :prefecture, :address, :munisicipality, :token, presence: true

  with_options presence: true do
    # 「住所」の郵便番号に関するバリデーション
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    #  電話番号に関するバリデーション
    validates :phone_number, format: {with: /\A[0-9]{11}\z/, message: "isn't invalid. Include hyphen(-)"}
  end
    
    # 「住所」の都道府県に関するバリデーション
    validates :prefecture, numericality: { other_than: 1, message: "can't be blank" }

  def save
    buyitem = BuyItem.create(item_id: item_id, user_id: user_id)
    DeliveryAddress.create(postal_code: postal_code, prefecture: prefecture, munisicipality: munisicipality, address: address, building_name: building_name, phone_number: phone_number, buy_item_id: buyitem.id)
  end
end