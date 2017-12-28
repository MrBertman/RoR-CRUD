class Task < ApplicationRecord
  #if Rails.env.production? || Rails.env.development?
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks
  #end
  #include Searchable
  belongs_to :user
  enum :importance => [:high, :middle, :low]
  validates :name, presence: true #{ message: I18n.t('empty_task_name') }
  validates :name, length:  { maximum: 50 }
  validates :description, length: { maximum: 500, message: "%{count} "+ I18n.t('characters_lenght_allowed') }
  validates :importance, inclusion: { :in => %w(high middle low),  message: "%{value} " + I18n.t('invalid_importance') }


  #if Rails.env.production? || Rails.env.development?
    mappings dynamic: false do
      indexes :id
      indexes :name, type: :text
      indexes :description
      indexes :user_id
    end
  #end


end
#Task.create_index
#Task.import force: true #if Rails.env.production? || Rails.env.development?
