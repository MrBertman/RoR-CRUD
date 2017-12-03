#require 'rspec'
#require 'models/task'

describe Task do

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