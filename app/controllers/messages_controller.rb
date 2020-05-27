class MessagesController < ApplicationController

  before_action :set_group

  def index
    @message = Message.new #form_forで使用 空のインスタンス生成
    @messages = @group.messages.includes(:user) #各ユーザーのメッセージを@messagesに代入？
    #includesメソッドはアソシエーションの為、指定された物は最小限のクエリクエリ回数で読み込まれる
  end

  def create
    @message = @group.messages.new(message_params) #プライベートメソッドを経由して安全性を確保 ＠groupはどこからくる？ set_group↓
    if @message.save #messageが保存できたら、のif文
      redirect_to group_messages_path, notice: "メッセージが送信されました"
    else
      @messages = @group.messages.includes(:user) #七行目に同じ
      flash.now[:alert] = "メッセージを入力してください"
      render :index #このindexは上記のindex?
    end
  end 

  private

  def message_params
    params.require(:message).permit(:body, :image).merge(user_id: current_user.id) #merge.(user_id: current_user.id)を復讐
  end

  def set_group
    @group = Group.find(params[:group_id])
  end #private以下にset_groupを定義し、before_actionを利用して呼び出すことで、messagesコントローラの全てのアクションで@groupを利用できるようになります
end
