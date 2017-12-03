class Task < ApplicationRecord
  belongs_to :user
  enum :importance => [:high, :middle, :low]
  validates :name, presence: { message: "must be given please" }
  validates :name, length: { in: 1..50, message: "%{count} characters is the maximum allowed" }
  validates :description, length: { maximum: 500, message: "%{count} characters is the maximum allowed" }
  validates :importance, inclusion: { in: %w(high middle low), message: "%{value} is not a valid importance" }
end
