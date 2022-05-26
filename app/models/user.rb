class User < ApplicationRecord
  has_secure_password
  has_many :feeds
  has_many :stories
  # has_many :feeds, dependent: :destroy
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    length: { maximum: 100 },
                    format: { with: VALID_EMAIL_REGEX }
validates :name, presence: true, length: { maximum: 50 }
def feed
  
end
end
