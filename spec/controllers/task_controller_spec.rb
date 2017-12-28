RSpec.describe TasksController do
  WebMock.disable_net_connect!
  before(:each) do
    any_uri = Addressable::Template.new "http://localhost:9200/tasks/task/{id}"
    stub_request(:any, any_uri).
        to_return(status: 200, body: "", headers: {})

    update_uri = Addressable::Template.new "http://localhost:9200/tasks/task/{id}/_update"
    stub_request(:any, update_uri).
        to_return(status: 200, body: "", headers: {})
  end

  describe "Without login" do
    it "should redirect to login page" do
      # Note, rails 3.x scaffolding may add lines like get :index, {}, valid_session
      # the valid_session overrides the devise login. Remove the valid_session from your specs
      get :index
      expect(response).to redirect_to('/auth/login')
    end
  end

  describe "With login" do
    before(:each) do
      request.env["HTTP_REFERER"] = "back_page"
      #{@user = FactoryBot.create(:user)}"
    end
    login_user

    it "should have a current_user" do
      # note the fact that you should remove the "validate_session" parameter if this was a scaffold-generated controller
      expect(subject.current_user).to_not eq(nil)
    end

    it "should get index" do
      # Note, rails 3.x scaffolding may add lines like get :index, {}, valid_session
      # the valid_session overrides the devise login. Remove the valid_session from your specs
      get :index
      expect(response).to be_success
    end

    describe "should show tasks" do

      it "render page" do
        get :index

        expect(response).to render_template('index')
      end
    end
    describe "task creation and validation"  do

      it "should create task" do
        post :create, params: { task: {name: 't1', description: 'desc', importance: 'low', expiry: Date.today(), done: false } }

        expect(response).to redirect_to('/')
      end

      it "render new page if validation fail" do
        post :create, params: {task: {name: nil}}

        expect(response).to render_template('new')
      end
    end

    describe "update task"  do
      before(:each) do
        @task = FactoryBot.create(:task, user: subject.current_user)
      end

      it "correct redirect to edition page" do
        get :edit, params: { id:@task.id }

        expect(response).to be_success
      end

      it "update data" do
        post :update, params: { id:@task.id, task: {name: 't1', description: 'desc', importance: 'low', expiry: Date.today(), done: false }}

        expect(response).to redirect_to('/')
      end

      it "redirect to main page if task don't exist" do
        get :edit, params: { id: 0 }

        expect(response).to redirect_to('/')
      end

    end

    it "delete task" do
      task = FactoryBot.create(:task, user: subject.current_user )
      post :delete,  params: { id:task.id}

      expect(response).to be_success
    end

    it "update locale" do
      post :update_locale, params: {locale: 'ru'}

      expect(response).to redirect_to("back_page")
    end
  end
end