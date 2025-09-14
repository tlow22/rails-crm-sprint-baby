class Note < ApplicationRecord
  belongs_to :contact

  # Validations
  validates :content, presence: true, length: { minimum: 1, maximum: 10000 }
  validates :pinned, inclusion: { in: [true, false] }

  # Scopes for querying
  scope :pinned, -> { where(pinned: true) }
  scope :unpinned, -> { where(pinned: false) }
  scope :recent, -> { order(created_at: :desc) }

  # Helper methods
  def pinned?
    pinned == true
  end

  def toggle_pin!
    update!(pinned: !pinned)
  end
end
