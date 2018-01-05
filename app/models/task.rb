class Task < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  belongs_to :user
  after_create do
    # log = Logger.new("log/task_log_#{Date.today}.txt")
    # log.add(Logger::Severity::INFO,nil,'Task') {"Object: #{self.to_json.to_s}"}
    # logger.info( Module: 'Task', TaskId:"#{self.id}", Status:"Created")
  end

  around_update do
    # logger.info( Module: 'Task', TaskId:"#{self.id}", Status:"Updated")
  end

  enum :importance => [:high, :middle, :low]
  validates :name, presence: true #{ message: I18n.t('empty_task_name') }
  validates :name, length:  { maximum: 50 }
  validates :description, length: { maximum: 500, message: "%{count} "+ I18n.t('characters_lenght_allowed') }
  validates :importance, inclusion: { :in => %w(high middle low),  message: "%{value} " + I18n.t('invalid_importance') }


  mappings dynamic: false do
    indexes :id
    indexes :name, type: :text
    indexes :description
    indexes :user_id
  end


end
