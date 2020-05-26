class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :groups, through: :group_users
  has_many :group_users

  validates :name, presence: true, uniqueness: true
#   NOT NULL制約では空の文字列は保存可能なため、validatesを使用します。
# 更にuser.rb に validates :name, presence: trueと追記し、空の文字列の場合もエラーが発生する様にしてください
end
