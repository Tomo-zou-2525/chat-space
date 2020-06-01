class Api::MessagesController < ApplicationController
  def index
    # ルーティングでの設定によりparamsの中にgroup_idというキーでグループのidが入るので、これを元にDBからグループを取得する
    group = Group.find(params[:group_id])
    # ajaxで送られてくる最後のメッセージのid番号を変数に代入
    last_message_id = params[:id].to_i
    # 取得したグループでのメッセージ達から、idがlast_message_idよりも新しい(大きい)メッセージ達のみを取得
    @messages = group.messages.includes(:user).where("id > ?", last_message_id)
  end
end

# Rubyのクラス名はこのように::で繋げて装飾することができます。これを名前空間またはnamespaceといいます。

# 名前空間(namespace)
# 名前空間をつけることにより、同様のクラス名で名付けたクラスを作ってもそれらを区別することができます。