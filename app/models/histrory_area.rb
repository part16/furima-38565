class HistroyArea
include ActiveModel::Model
attr_accessor :user_id,:item_id,:post_code, :ship_id,:city, :address, :building, :phone_number

  validates :user_id,      presence: true
  validates :item_id,      presence: true
  validates :post_code,    presence: true
  validates :ship_id,      presence: true
  validates :city,         presence: true
  validates :address,      presence: true
  validates :building      presence: true
  validates :phone_number, presence: true

  def save
    
  end
end
