describe "Mock requests" do
  WebMock.disable_net_connect!
  before(:each) do
    #any_uri = Addressable::Template.new
    stub_request(:any, /localhost:9200/).to_rack(FakeController)
    #to_return(status: 200, body: "", headers: {})

    # to_return(status: 200, body: "", headers: {})

    # update_uri = Addressable::Template.new "http://localhost:9200/tasks/task/{id}/_update"
    # stub_request(:any, update_uri).
    #     to_return(status: 200, body: "", headers: {})
  end

  describe "Post with custom params" do
    it "should" do
      uri = URI('https://localhost:9200/tasks/task/10')

      response = JSON.parse(Net::HTTP.get(uri))
      id = response[0]['tasks'][0][0]['id']


      expect(id).to eq 10
    end
  end
end