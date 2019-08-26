class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :zip , format: {with: /\A[0-9]{7}\z/} #半角のみ、数字７文字
  validates :phone_number , format: {with: /\A[0-9]{11}\z/} #半角のみ、数字11文字
  validates :kana_last , format: {with: /\A[ァ-ヶーー]+\z/} #
  validates :kana_first , format: {with: /\A[ァ-ヶーー]+\z/}

  has_many :delivery_addresses
  has_many :orders
  has_many :carts
  has_many :favorites, dependent: :destroy
  accepts_nested_attributes_for :delivery_addresses, allow_destroy: true

  def favorited_by?(end_user)
    favorites.where(end_user_id: end_user.id).exists?
  end

end
