RSpec.describe TasksController  do
  def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      sign_in FactoryBot.create(:admin) # Using factory girl as an example
    end
  end

  describe "GET index" do
    it "renders the index template" do
      get :index
      expect(response).to redirect_to('/auth/login')
    end
    it "login" do
      get :index

      expect(response).to redirect_to('/auth/login')
    end
  end
  describe "Login", :type => :feature do
    it "Log in" do
      visit '/auth/login'
      within("#new_user") do
        fill_in 'Email', with: 'adimn@admin.com'
        fill_in 'Password', with: 'password'
      end
      click_button 'Log in'
      expect(response.status).to eq(200)
    end
  end
  describe "Tasks process", :type => :feature do
    before :each do
      visit '/auth/login'
      within("#new_user") do
        fill_in 'Email', with: 'adimn@admin.com'
        fill_in 'Password', with: 'password'
      end
      click_button 'Log in'
    end
  end
end