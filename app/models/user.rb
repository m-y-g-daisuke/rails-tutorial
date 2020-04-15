class User < ApplicationRecord
  validates :name, presence: true, length:{maximum: 50}
  #別の書き方validates (:name,presence:true)
  validates :email, presence: true, length:{maximum: 255}
end
