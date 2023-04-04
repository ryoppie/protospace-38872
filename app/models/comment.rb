class Comment < ApplicationRecord
  belongs_to :prototype  # prototypeテーブルとのアソシエーション
  belongs_to :user  # usersテーブルとのアソシエーション
  
  validates :comment, presence: true

end
