module SessionsHelper

  #渡されたユーザーでログインする
  def log_in(user)
    session[:user_id] = user.id
  end
  
  #永続セッションとしてユーザーを記憶する
  def remember(user)
    user.remember #インスタンスメソッドを使って、userのからむremember_digestを保存、作成
    cookies.permanent.signed[:user_id]=user.id#永続クッキーとして暗号化したuser_idを作成
    cookies.permanent[:remember_token]=user.remember_token#永続クッキーとして、remember_tokenにrememberメソッドないで定義したremember_tokenを代入（新しい記憶トークン）
  end

  #渡されたユーザーがログイン済のユーザーであれば、trueを返す
  def current_user?(user)
    user== current_user
  end

  #現在ログイン中のユーザーを返す(いる場合)
  def current_user
    if (user_id=session[:user_id]) # =trueならば
      @current_user ||= User.find_by(id:user_id)
      #@current_user = @current_user || User.find_by(id:session[:user.id])
      # ↑current_userメソッドが呼ばれた時に、左辺のUserを見つけるか、既に入っているならばインスタンス変数を呼び出す
    elsif (user_id = cookies.signed[:user_id]) #一時セッションが切れている時で、永続セッションが存在すれば
      user = User.find_by(id:user_id)
      if user && user.authenticated?(cookies[:remember_token])#永続クッキーのトークンが今のuserのremember_digestと等しいか確認
        log_in user
        @current_user = user
      end
    end
  end

  # ユーザーがログインしていればtrue、その他ならfalseを返す
  def logged_in?
    !current_user.nil?
  end

  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  #現在のユーザーをログアウトする
  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end
end
