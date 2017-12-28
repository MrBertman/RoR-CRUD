#require 'rspec'
#require 'models/task'

describe Task do
  WebMock.disable_net_connect!
  before(:each) do
    stub_request(:delete, "http://localhost:9200/tasks").
        with(headers: {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'Content-Type'=>'application/json', 'User-Agent'=>'Faraday v0.13.1'}).
        to_return(status: 200, body: "", headers: {})
  end

  it 'validate name' do
    task = Task.create(name: '')
    expect(task).to_not be_valid
  end
  it "name > 50 " do
    task = Task.create(name: '123456789012345678901234567890123456789012345678901234567890')
    expect(task).to_not be_valid
  end
  it "description > 500 " do
    task = Task.create(name: '123', description: '123456789012345678901234567890123456789012345678901234567890
                                                          123456789012345678901234567890123456789012345678901234567890
                                                          123456789012345678901234567890123456789012345678901234567890
                                                          123456789012345678901234567890123456789012345678901234567890
                                                          123456789012345678901234567890123456789012345678901234567890
                                                          123456789012345678901234567890123456789012345678901234567890')
    expect(task).to_not be_valid
  end
  it "invalid importance" do
    task = Task.create(name: '123', description:'adawd', importance: "low")
    expect(task).to_not be_valid
  end
end