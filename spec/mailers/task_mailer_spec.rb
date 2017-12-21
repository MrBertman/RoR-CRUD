require "rails_helper"

RSpec.describe TaskMailer, type: :mailer do
  it "send mail" do
    task = FactoryBot.create(:task)
    email = TaskMailer.task_deleted(task)

    assert_emails 1 do
      email.deliver_now
    end
    assert_equal ['task@app.rails'], email.from
    assert_equal ['mrbertman.k@gmail.com'], email.to
    assert_equal 'Task deleted', email.subject
  end
end
