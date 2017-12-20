RSpec.describe ApplicationHelper, :type => :helper do
  describe "url to link" do
    it "urt to link https" do
      res = helper.url_to_links("https://www.page.com")
      exp = "<a target=\"_blank\" href=\"https://www.page.com\">https://www.page.com</a>"
      expect(res).to eq(exp)
    end

    it "url to link http" do
      res = helper.url_to_links("http://www.page.com")
      exp = "<a target=\"_blank\" href=\"http://www.page.com\">http://www.page.com</a>"
      expect(res).to eq(exp)
    end

    it "no url in text" do
      res = helper.url_to_links("text without url")
      exp = "text without url"
      expect(res).to eq(exp)
    end
  end
end