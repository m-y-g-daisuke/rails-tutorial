class User < ApplicationRecord
  validates :name, presence: true
  #別の書き方validates (:name,presence:true)
end
