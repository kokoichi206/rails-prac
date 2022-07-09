class User < ApplicationRecord
  # この関連付けの表現は必要？
  has_many :microposts
  validates :name, presence: true
  validates :email, presence: true
end
