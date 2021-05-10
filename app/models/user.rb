class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    has_many :items
    has_many :purchases
    has_one :card, dependent: :destroy

  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i } 
  with_options presence: true do
    validates :nick_name
    validates :date
    with_options format: { with: /\A[ぁ-ゔァ-ヴ一-龥]+\z/ } do
      validates :family_name
      validates :first_name
    end
    with_options format: { with: /\A[ァ-ヶー－]+\z/ } do
      validates :family_name_kana
      validates :first_name_kana
    end
  end
end

