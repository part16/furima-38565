class HistoryArea
include ActiveModel::Model
attr_accessor :token, :user_id,:item_id,:post_code, :ship_id,:city, :address, :building, :phone_number

  validates :token, presence: true 
  validates :user_id,      presence: true
  validates :item_id,      presence: true
  validates :post_code,    presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
  validates :ship_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :city,         presence: true
  validates :address,      presence: true
  validates :phone_number, presence: true, format: { with: /\A[0-9]+\z/ }, length: { in: 10..11 }

  def save
    history = History.create(user_id: user_id, item_id: item_id)
    Area.create(history_id: history.id,post_code: post_code,ship_id: ship_id,city: city,address: address,building: building,phone_number: phone_number)
  end
end
