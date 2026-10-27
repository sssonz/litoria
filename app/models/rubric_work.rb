class RubricWork < ApplicationRecord
  belongs_to :rubric
  belongs_to :work

  validates :work_id, uniqueness: { scope: :rubric_id }
end
