class Work < ApplicationRecord
  belongs_to :user
  belongs_to :fandom

  has_many :chapters, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy

  has_many :work_tags, dependent: :destroy
  has_many :tags, through: :work_tags

  validates :title, presence: true
  validates :summary, presence: true
  validates :work_type, inclusion: { in: %w[fanfiction original] }
  validates :status, inclusion: { in: %w[draft ongoing completed] }
end
