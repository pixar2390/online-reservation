class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #スペースなどの空白文字列で名前登録をしないようにバリデーションをかける
  validates :name, presence: true
end
