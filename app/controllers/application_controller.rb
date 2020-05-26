class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
# ・HTMLタグだけでフォームを作るな、ビューヘルパーを使え
# ・レイアウトファイルにcsrf_meta_tagsの記載を忘れるな
# ・HTTP GET によるリンクでデータの操作をしない CSRF対策
  before_action :authenticate_user! #コントローラーに設定して、ログイン済ユーザーのみにアクセスを許可する
  before_action :configure_permitted_parameters, if: :devise_controller?
  # :devise_contoller?とはdeviseを生成した際にできるヘルパーメソッドの一つで、deviseにまつわる画面に行った時に、という意味がある。こうすることで全ての画面でconfigure_permitted_parametersをするのを防いでいるのである。

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name]) #ストロングパラメータは初期段階でメールとパスワードが設定されている。 ネームを追加するためにもビフォーアクションでメソッドの呼び出し→実行の流れを理解する
  end
#   deviseでは初期状態でサインアップ時にメールアドレスとパスワードのみを受け取るようにストロングパラメーターが設定してあるので、追加したキーのパラメーターは許可されていません。
# 追加のパラメーターを許可したい場合は、application_controller.rbにおいてbefore_actionにconfigure_permitted_parametersメソッドを設定
end
