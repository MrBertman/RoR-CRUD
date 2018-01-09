class Task < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  belongs_to :user
  after_create do
    task_logger = LogStashLogger.new(port: 5227)
    # log.add(Logger::Severity::INFO,nil,'Task') {"Object: #{self.to_json.to_s}"}
    task_logger.info( ActiveRecord: "Task", Action:"Created",  Data: self.to_json.to_s)
  end

  after_update do
    task_logger = LogStashLogger.new(port: 5227)
    # log.add(Logger::Severity::INFO,nil,'Task') {"Object: #{self.to_json.to_s}"}
    task_logger.info( ActiveRecord: "Task", Action:"Updated",  Data: self.to_json.to_s)
  end

  after_destroy do
    task_logger = LogStashLogger.new(port: 5227)
    task_logger.info( ActiveRecord: "Task", Action:"Destroyed",  Data: self.to_json.to_s)
  end


  after_validation :log_errors, :if => Proc.new {|m| m.errors}

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

  def log_errors
    task_logger = LogStashLogger.new(port: 5227)
    task_logger.error( ActiveRecord: "Task", Action:"Validation", ErrorMessage: self.errors.full_messages.join("\n"), Data: self.to_json)
  end

end
