require 'rails_helper'

RSpec.describe TaskJob, type: :job do
  it "perform job" do
  task = FactoryBot.create(:task)
  TaskJob.perform_now(task.id)
  expect(task).to be_nil
  end
end
