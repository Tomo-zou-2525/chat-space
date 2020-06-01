json.array! @users do |user|
  json.name user.name
  json.id user.id
end
  # jbuilder:array! メソッド
# jbuilderという拡張子を持つテンプレートでは、JSONという名前のJbuilderオブジェクトが自動的に利用できるようになります。
# Jbuilderオブジェクトは、JSON形式に返すための便利なメソッドがたくさん用意されており、配列で返したい場合はarray!を使用します。

# array!を使用することで以下のように、JavaScript側に配列で値を送ることが可能です。

# JavaScript側に送る配列
# [{
#  id: 1,
#  image: "https://~.jpg",
#  nickname: "やべ",
#  text: "プログラミングの勉強中",
#  user_id: 1,
#  user_sign_in:
#     {created_at: "2019-10-08T01:47:37.000Z",
#     email: "aaa@gmail.com",
#     id: 1,
#     nickname: "やべ",
#     updated_at: "2019-10-08T01:47:37.000Z"}
# }]
# 上記のように、jbuilderを使用するとより少ない記述でJSON形式のデータを作ることができます。