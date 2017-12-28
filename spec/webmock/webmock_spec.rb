describe "Webmock:" do
  WebMock.disable_net_connect!
  before(:each) do
    stub_request(:get, /api.github.com/).
        with(headers: {'Accept'=>'*/*', 'User-Agent'=>'Ruby'}).
        to_return(status: 200, body: "stubbed response", headers: {})
  end

  it "should request be ok" do
    uri = URI('https://api.github.com/repos/thoughtbot/factory_girl/contributors')

    response = Net::HTTP.get(uri)

    expect(response).to be_an_instance_of(String)
  end

end