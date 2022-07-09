class Micropost < ApplicationRecord
  # １つのマイクロポストは１人のユーザーにのみ属する。
  belongs_to :user
  validates :content, length: { maximum: 140 },
                      presence: true
end
