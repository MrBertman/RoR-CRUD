describe "Simple object mocking(rspec-mock):" do
  #skip "skipped" do
    it "should mock object" do
      my_obj = double("my_obj")
      expect(my_obj).not_to be_nil
    end

    it "should perform method" do
      my_obj = double("my_obj")
      allow(my_obj).to receive('do_something')
      expect(my_obj).to respond_to(:do_something)
    end

    it "should perform method and return result" do
      my_obj = double("my_obj")                                             # alternative syntaxis
      allow(my_obj).to receive('do_something').and_return('something_done') # => my_obj = double("my_obj", :do_something => "something_done")
      expect(my_obj.do_something).to eq('something_done')
    end

    it "should perform chain of methods" do
      my_obj = double("my_obj")
      allow(my_obj).to receive_message_chain(:do_something, :do_something_else => :something_done)
      expect(my_obj.do_something.do_something_else).to eq(:something_done)
    end

    it "should perform method with exact params" do
      my_obj = double("my_obj")
      expect(my_obj).to receive(:do_something).with(1,2,3).and_return(6)
      expect(my_obj.do_something(1,2,3)).to eq(6)
    end

    it "should raise error" do
      my_obj = double("my_obj")
      expect(my_obj).to receive(:do_something).with(0).and_raise(ArgumentError)
      expect{my_obj.do_something(0)}.to raise_error(ArgumentError)
    end

    it "should throw exception" do
      my_obj = double("my_obj")
      expect(my_obj).to receive(:do_something).with(0).and_throw(:Exception)
      expect{my_obj.do_something(0)}.to throw_symbol(:Exception)
    end

    it "should stab method of class end" do
      tsk = double("tsk")
      allow(Task).to receive(:name) { "Name" }
      expect(Task.name).to eq("Name")
    end

    it "should stab object's method" do
      tsk = Task.new
      allow(tsk).to receive(:name) { "Name" }
      expect(tsk.name).to eq("Name")
    end

    it "should mock object of real class" do
      tsk = double(Task)
      allow(tsk).to receive(:fun) {:res}
      expect(tsk.fun).to eq(:res)
    end
  #end
end

describe "Mocha object mocking:" do
  skip "skipped" do
    it "should mock object" do
      my_obj = mock()
      expect(my_obj).not_to be_nil
    end

    it "should perform method" do
      my_obj = mock()
      my_obj.stubs('do_something')
      expect(my_obj).to respond_to(:do_something)
    end

    it "should perform method and return result" do
      my_obj = mock()
      my_obj.expects('do_something').returns('something_done')
      expect(my_obj.do_something).to eq('something_done')
    end

    it "should perform chain of methods" do
      my_obj = mock()
      my_obj.expects(:do_something=>mock(:do_something_else => :something_done))
      expect(my_obj.do_something.do_something_else).to eq(:something_done)
    end

    it "should perform method with exact params" do
      my_obj = mock()
      my_obj.expects(:do_something).with(1,2,3).returns(6)
      expect(my_obj.do_something(1,2,3)).to eq(6)
    end

    it "should raise error" do
      my_obj = mock()
      my_obj.expects(:do_something).with(0).raises(ArgumentError)
      expect{my_obj.do_something(0)}.to raise_error(ArgumentError)
    end

    it "should throw exception" do
      my_obj = mock()
      my_obj.expects(:do_something).with(0).throws(:Exception)
      expect{my_obj.do_something(0)}.to throw_symbol(:Exception)
    end

    it "should expend real object" do
      tsk = Task.new
      tsk.stubs(:fun).returns(1)
      expect(tsk.fun).to eq(1)
    end

    it "should stub class with new method" do
      Task.stubs(:fun).returns(1)
      expect(Task.fun).to eq(1)
    end

    it "should stub object existing method" do
      tsk = Task.new
      tsk.stubs(:name).returns('stubbed')
      expect(tsk.name).to eq('stubbed')
    end
  end
end