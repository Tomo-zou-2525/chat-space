class GroupsController < ApplicationController

  def index
  end

  def new
    @group = Group.new #form_forで使用
    @group.users << current_user #配列に要素を追加 ChatSpaceの仕様として、グループを新規作成する時はログイン中のユーザーを必ず含めたいため
  end

  def create
    @group = Group.new(group_params) #空のインスタンス変数を定義 引数にストロングパラメータ
    if @group.save 
      redirect_to root_path, notice: "グループを作成しました" #保存できたらroot_path→messages#indexに返す
    else
      render :new #そのままの情報でnewのURLに返す @groupにはエラーメッセージも含まれているので、更新しないようにrenderメソッドで
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to root_path, notice: 'グループを更新しました'
    else
      render :edit
    end
  end

  private
  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end  #配列に対して保存を許可したい場合は、キーの名称と関連づけてバリュ                                           ーに「[]」と記述します。

end
