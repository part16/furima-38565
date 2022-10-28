class Item < ApplicationRecord
  validates :item_name,         presence: true 
  validates :item_discribe,     presence: true 
  validates :item_price,        presence: true ,numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
                                                format: { with: /\A[0-9]+\z/ }
  validates :image,             presence: true
  has_one_attached :image
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :category
    belongs_to :state
    belongs_to :postage
    belongs_to :ship
    belongs_to :scheduled_day

    validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :state_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :postage_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :ship_id, numericality: { other_than: 1 , message: "can't be blank"}
    validates :scheduled_day_id, numericality: { other_than: 1 , message: "can't be blank"}



end
