class Rubric < ApplicationRecord
  has_many :rubric_works, dependent: :destroy
  has_many :works, through: :rubric_works

  validates :name, presence: true, uniqueness: true
end
