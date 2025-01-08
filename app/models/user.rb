class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: { message: 'を入力してください' }
  validates :email, presence: { message: 'を入力してください' }, uniqueness: { message: 'はすでに登録されています' }
  validates :password, presence: { message: 'を入力してください' }, length: { minimum: 6, message: 'は6文字以上で入力してください' }, confirmation: true
  validates :last_name, presence: { message: 'を入力してください' },
                        format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: 'は全角（漢字・ひらがな・カタカナ）で入力してください' }
  validates :first_name, presence: { message: 'を入力してください' },
                         format: { with: /\A[ぁ-んァ-ン一-龥々ー]+\z/, message: 'は全角（漢字・ひらがな・カタカナ）で入力してください' }
  validates :last_name_kana, presence: { message: 'を入力してください' }, format: { with: /\A[ァ-ヶー]+\z/, message: 'は全角（カタカナ）で入力してください' }
  validates :first_name_kana, presence: { message: 'を入力してください' }, format: { with: /\A[ァ-ヶー]+\z/, message: 'は全角（カタカナ）で入力してください' }
  validates :birthday, presence: { message: 'を入力してください' }
end
