RSpec.describe TaskMailer, type: :mailer do
  WebMock.disable_net_connect!
  before(:each) do
    any_uri = Addressable::Template.new "http://localhost:9200/tasks/task/{id}"
    stub_request(:any, any_uri).
        to_return(status: 200, body: "", headers: {})
  end

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
