module ApplicationHelper

  #ページごとの完全なタイトルを返します
  def full_title(page_title = "") #引数としてデフォルト値がnilで入っている
    base_title = "Ruby on Rails Tutorial Sample App"
    if page_title.empty? #引数がnilの時の条件。つまりはデフォルトの返り値
      base_title
    else
      page_title + " | " + base_title
    end
  end
end
