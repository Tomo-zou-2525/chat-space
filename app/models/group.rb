class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users
  validates :name, presence: true, uniqueness: true
end
# 「多対多」を使用する時によく使われる記述です。

# has_manyの引数に「アソシエーションを組みたいテーブル名」を、:throughのバリューに「中間テーブル名」を指定します。これによって、「group.users」といった呼び出し方ができるようになります。