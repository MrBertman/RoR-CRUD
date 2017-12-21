class TaskMailer < ApplicationMailer
  default from: "task@app.rails",
          template_path: 'task_mailer'

  def task_deleted(task)
    @task = task
    mail to: 'mrbertman.k@gmail.com',
         subject: 'Task deleted'
  end
end
