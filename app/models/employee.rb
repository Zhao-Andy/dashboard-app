class Employee < ApplicationRecord
  belongs_to :user
  validates :first_name, :last_name, :email, :hiring_date, :user_id, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
