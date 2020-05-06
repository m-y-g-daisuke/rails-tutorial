module SessionsHelper

  #渡されたユーザーでログインする
  def log_in(user)
    session[:user_id] = user.user_id
  end

  #現在ログイン中のユーザーを返す(いる場合)
  def current_user
    if session[:user_id] # =trueならば
      @current_user|| = User.find_by(id:session[:user.id])
      #@current_user = @current_user || User.find_by(id:session[:user.id])
      # ↑current_userメソッドが呼ばれた時に、左辺のUserを見つけるか、既に入っているならばインスタンス変数を呼び出す
    end
  end

  # ユーザーがログインしていればtrue、その他ならfalseを返す
  def logged_in?
    !current_user.nil?
  end
end
