class Item < ApplicationRecord
  validates :image, presence: true
  validates :item_name, presence: true
  validates :explanation, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :postage_id, presence: true
  validates :area_id, presence: true
  validates :send_day_id, presence: true
  validates :price, presence: true

  belongs_to :user
end
