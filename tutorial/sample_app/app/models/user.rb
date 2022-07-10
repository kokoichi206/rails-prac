class User < ApplicationRecord
  
  # DB に保存する前に呼ばれるコールバック。
  # Email では大文字小文字を区別せずに一意性をかけたいため、
  # 保存する直前に全部小文字にする
  before_save { self.email = email.downcase }
  
  # validates はメソッドであり、以下と等価
  # validates(:name, presence: true)
  validates :name,  presence: true, length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  has_secure_password
end
