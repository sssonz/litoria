class User < ApplicationRecord
  has_many :works, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :role, inclusion: { in: %w[user admin] }
end
