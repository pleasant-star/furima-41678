class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :zip_code, :area_id, :city, :address_line, :building_name, :tell

  with_options presence: true do
    validates :zip_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :address_line
    validates :tell, format: { with: /\A\d{10,11}\z/, message: 'must be 10 or 11 digits' }
    validates :user_id
    validates :item_id, presence: true
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)

    Address.create(zip_code: zip_code, area_id: area_id, city: city, address_line: address_line, building_name: building_name,
                   tell: tell, purchase_id: purchase.id)
  end
end
