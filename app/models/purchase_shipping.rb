class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipalities, :street_address, :building_name, :telephone, :purchase_id, :user_id, :item_id, :purchase_id, :token

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :municipalities
    validates :street_address
    validates :telephone, numericality: {only_integer: true}, length: { minimum: 10, maximum: 11 }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    # 配送情報を保存する
    # purchase_idには、変数purchaseのidと指定する
    Shipping.create(post_code: post_code, prefecture_id: prefecture_id, municipalities: municipalities, street_address: street_address, building_name: building_name, telephone: telephone, purchase_id: purchase.id)
  end
end