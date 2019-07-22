class Task < ApplicationRecord
  belongs_to :user

  def completed?
    !completed_at.blank?
  end

  scope :sorted_desc, -> { order(created_at: :desc) }
end
