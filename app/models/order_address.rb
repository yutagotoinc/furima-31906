class OrderAddress
  include ActiveModel::Model
  attr_accessor :product_id, :user_id,:zip_code, :prefecture_id, :city, :block_number, :building, :phone_number , :token

  with_options presence: true do
    validates :product_id
    validates :user_id
    validates :zip_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :block_number
    validates :phone_number, length: { minimum: 10, maximum: 11 }
    with_options numericality: { other_than: 1 } do
      validates :prefecture_id
    end
    validates :token
    validates :phone_number, numericality: { only_integer: true }
  end

  def save
    @order = Order.create(product_id: product_id, user_id: user_id)

    Address.create(zip_code: zip_code, prefecture_id: prefecture_id, city: city, block_number: block_number, building: building,
                   phone_number: phone_number, order_id: @order.id)
  end
end