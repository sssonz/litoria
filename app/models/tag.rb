class Tag < ApplicationRecord
  has_many :work_tags, dependent: :destroy
  has_many :works, through: :work_tags

  validates :name, presence: true
  validates :kind, inclusion: { in: %w[genre trope warning tag] }
end
