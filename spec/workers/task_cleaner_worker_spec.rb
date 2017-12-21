require 'rails_helper'
RSpec.describe TaskCleanerWorker, type: :worker do
  it "perform delete" do
    task = FactoryBot.create(:task)
    TaskCleanerWorker.new.perform(task.id)
    expect(task).to be_nil
  end
end
