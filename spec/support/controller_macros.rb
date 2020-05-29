module ControllerMacros
  def login(user)
    @request.env["devise.mapping"] = Devise.mappings[:user]
    sign_in user
  end
end

# deviseを用いて「ログインをする」ためのloginメソッドは、問題5で定義したものです。