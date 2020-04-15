class User < ApplicationRecord
  validates :name, presence: true, length:{maximum: 50}
  #別の書き方validates (:name,presence:true)
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i  #大文字はrubyでは定数を表す
  validates :email, presence: true, length:{maximum: 255},
  format:{with:VALID_EMAIL_REGEX}
end
