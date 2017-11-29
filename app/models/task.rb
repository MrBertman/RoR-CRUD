class Task < ApplicationRecord
  belongs_to :user
  enum :importance => [:high, :middle, :low]
end
