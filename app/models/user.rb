class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :favorites
  has_many :artworks, through: :favorites
  has_many :comments
  has_many :orders
  has_one :artist
  has_one :card, dependent: :destroy

  VALID_ZENKAKU_REGEX = /\A[ぁ-んァ-ン一-龥]/.freeze
  VALID_KATAKANA_REGEX = /\A[ァ-ヶー－]+\z/.freeze
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])/.freeze

  with_options presence: true do
    validates :nickname, uniqueness: true
    validates :last_name, format: { with: VALID_ZENKAKU_REGEX, message: 'は全角(漢字・ひらがな・カタカナ)で入力してください' }
    validates :first_name, format: { with: VALID_ZENKAKU_REGEX, message: 'は全角(漢字・ひらがな・カタカナ)で入力してください' }
    validates :last_name_kana, format: { with: VALID_KATAKANA_REGEX, message: 'は全角(カタカナ)で入力してください' }
    validates :first_name_kana, format: { with: VALID_KATAKANA_REGEX, message: 'は全角(カタカナ)で入力してください' }
    validates :birth_date
  end

  validates :password, format: { with: VALID_PASSWORD_REGEX, message: "は半角英数字混合で入力してください" }

end

