class Group < ApplicationRecord
  has_many :group_users
  has_many :users, through: :group_users
  has_many :messages
  validates :name, presence: true, uniqueness: true

# 「多対多」を使用する時によく使われる記述です。

# has_manyの引数に「アソシエーションを組みたいテーブル名」を、:throughのバリューに「中間テーブル名」を指定します。これによって、「group.users」といった呼び出し方ができるようになります。
  def show_last_message
    if (last_message = messages.last).present?
      if last_message.content?
        last_message.content
      else
        '画像が投稿されています'
      end
    else
      'まだメッセージはありません。'
    end
  end

end