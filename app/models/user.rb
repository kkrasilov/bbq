class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[a-z\d_+.\-]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  has_many :events

  validates :name, presence: true, length:  {maximum: 35}
  validates :email, presence: true, length: {maximum: 255}
  validates :email, uniqueness: true
  validates :email, format: {with: VALID_EMAIL_REGEX}
end
