class Work < ApplicationRecord
  has_one_attached :cover
  validate :validate_cover

  belongs_to :user
  belongs_to :fandom

  has_many :chapters, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy

  has_many :work_tags, dependent: :destroy
  has_many :tags, through: :work_tags

  has_many :rubric_works, dependent: :destroy
  has_many :rubrics, through: :rubric_works

  validates :title, presence: true
  validates :summary, presence: true
  validates :work_type, inclusion: { in: %w[fanfiction original] }
  validates :status, inclusion: { in: %w[draft ongoing completed] }
  validates :rating, inclusion: { in: %w[16+ 18+] }

  private

  def validate_cover
    return unless cover.attached?

    allowed_types = %w[image/jpeg image/png image/webp]

    unless allowed_types.include?(cover.blob.content_type)
      errors.add(:cover, "должна быть в формате JPG, PNG или WebP")
    end

    if cover.blob.byte_size > 5.megabytes
      errors.add(:cover, "не должна превышать 5 МБ")
    end
  end
end
