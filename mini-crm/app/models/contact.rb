class Contact < ApplicationRecord
  has_many :notes, dependent: :destroy

  # Validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  # Helper methods
  def full_name
    "#{first_name} #{last_name}"
  end

  def display_name
    company.present? ? "#{full_name} (#{company})" : full_name
  end
end
