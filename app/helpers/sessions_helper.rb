module SessionsHelper

  #渡されたユーザーでログインする
  def log_in(user)
    session[:user_id] = user.id
  end

  def remember(user)
    user.remember #インスタンスメソッドを使って、userのからむremember_digestを保存、作成
    cookies.permanent.signed[:user_id]=user.id#永続クッキーとして暗号化したuser_idを作成
    cookies.permanent[:remember_token]=user.remember_token#永続クッキーとして、remember_tokenにrememberメソッドないで定義したremember_tokenを代入（新しい記憶トークン）
  end

  #現在ログイン中のユーザーを返す(いる場合)
  def current_user
    if session[:user_id] # =trueならば
      @current_user ||= User.find_by(id:session[:user_id])
      #@current_user = @current_user || User.find_by(id:session[:user.id])
      # ↑current_userメソッドが呼ばれた時に、左辺のUserを見つけるか、既に入っているならばインスタンス変数を呼び出す
    end
  end

  # ユーザーがログインしていればtrue、その他ならfalseを返す
  def logged_in?
    !current_user.nil?
  end

  #現在のユーザーをログアウトする
  def log_out
    session.delete(:user_id)
    @current_user = nil?
  end
end
