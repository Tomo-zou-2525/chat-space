class UsersController < ApplicationController

  def edit
  end

  def update
    if current_user.update(user_params) #ユーザー情報の入った箱params updateされたらtrue
      redirect_to root_path #どこへ？
    else
      render :edit #edit呼び出し
    end
  end

    private

    def user_params #ストロングパラメータ
      params.requier(:user).permit(:name, :email)
    end  #requireメソッドがデータのオブジェクト名を定める
         #params.permit(:キー名, :キー名)
end
