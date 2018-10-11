class User < ApplicationRecord
  has_many :feeds
  has_many :favorites, dependent: :destroy
  has_many :favorite_feeds, through: :favorites, source: :feed

  has_secure_password
  validates :password_digest, presence: true, length: { minimum: 6 }
end
