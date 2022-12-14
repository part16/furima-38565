class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname,   presence: true 
         validates :birth_date, presence: true 

         validates :name_sei, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ , message: 'is invalid. Input full-width characters'}  
         validates :name_mei, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ , message: 'is invalid. Input full-width characters'}
  

         validates :name_furi, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ , message: 'is invalid. Input full-width katakana characters'}  
         validates :name_gana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ , message: 'is invalid. Input full-width katakana characters'} 
         
         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates_format_of :password, with: PASSWORD_REGEX, message: 'is invalid. Include both letters and numbers'
  has_many :histories
  has_many :items
end
