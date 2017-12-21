class TaskCleanerWorker
  include Sidekiq::Worker

  def perform(task_id)
    task = Task.find(task_id)
    task.destroy!
    # Do something
  end
end
