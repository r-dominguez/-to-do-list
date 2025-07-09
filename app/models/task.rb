class Task < ApplicationRecord
  belongs_to :user

  validates :title, :description, presence: true
  validates :title, length: { maximum: 100 }
  validates :description, length: { maximum: 1000 }

  scope :completed, -> { where(completed: true) }

  def mark_as_completed!
    update!(completed: true)
  end
end
