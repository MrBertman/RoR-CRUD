class Task < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  belongs_to :user
  enum :importance => [:high, :middle, :low]
  validates :name, presence: true #{ message: I18n.t('empty_task_name') }
  validates :name, length:  { maximum: 50 }
  validates :description, length: { maximum: 500, message: "%{count} "+ I18n.t('characters_lenght_allowed') }
  validates :importance, inclusion: { :in => %w(high middle low),  message: "%{value} " + I18n.t('invalid_importance') }

  mappings dynamic: false do
    indexes :name, type: 'string'
  end
end
#Task.create_index
#Task.import force: true
