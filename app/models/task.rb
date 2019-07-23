class Task < ApplicationRecord
  belongs_to :user

  validates :content,
    length: { minimum: 1, maximum: 10 }
  validates :description,
  length: { minimum: 1, maximum: 256 }

  def completed?
    !completed_at.blank?
  end

  scope :sorted_desc, -> { order("created_at desc") }
end