class Item < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :itemsituation
  belongs_to :burden
  belongs_to :prefecture
  belongs_to :duration

  validates :item_name, presence: true
  validates :item_comment, presence: true
  validates :category_id, numericality: { other_than: 1 }, presence: true
  validates :itemsituation_id, numericality: { other_than: 1 }, presence: true
  validates :burden_id, numericality: { other_than: 1 }, presence: true
  validates :prefecture_id, numericality: { other_than: 1 }, presence: true
  validates :duration_id, numericality: { other_than: 1 }, presence: true
  validates :price, presence: true,
                    numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, only_integer: true }
  validates :image, presence: true

  belongs_to :user
  has_many :purchases
end
