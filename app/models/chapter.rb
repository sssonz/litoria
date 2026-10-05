class Chapter < ApplicationRecord
  belongs_to :work

  has_many :comments, as: :commentable, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true
  validates :position, presence: true
end
