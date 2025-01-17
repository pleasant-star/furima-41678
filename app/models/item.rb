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
  validates :image, presence: true

  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :postage
  belongs_to :area
  belongs_to :send_day

  validates :category, :text, presence: true

  validates :category_id, numericality: { other_than: 1, message: "can't be blank" }
end
