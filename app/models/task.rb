class Task < ApplicationRecord
  belongs_to :user
  enum :importance => [:high, :middle, :low]
  validates :name, presence: true #{ message: I18n.t('empty_task_name') }
  validates :name, length:  { maximum: 50 }
  validates :description, length: { maximum: 500, message: "%{count} "+ I18n.t('characters_lenght_allowed') }
  validates :importance, inclusion: { in: %w(high middle low),  message: "%{value} " + I18n.t('invalid_importance') }
end
