class History < ApplicationRecord
  has_one :area
  belongs_to :user
  belongs_to :item
end
