RSpec.describe UsersController do
  # describe "GET index" do
  #   it "has a 200 HTTP status code" do
  #     get :index
  #     expect(response.status).to eq 200
  #   end
  #
  #   it "assigns all users as @users" do
  #     user = User.create
  #     get :index
  #     expect(assigns(:users)).to eq([user])
  #   end
  #
  #   it "renders the index template" do
  #     get :index
  #     expect(response).to render_template("index")
  #   end
  # end

  describe "GET show" do
    it "returns a 200 HTTP status code" do
      user = User.create(password: "pw", first_name: "fn", last_name: "ln", email: "e")
      get :show, params: { id: user.id }
      expect(response.status).to eq 200
    end

    it "assigns the requested user as @user" do
      user = User.create(password: "pw", first_name: "fn", last_name: "ln", email: "e")
      get :show, params: { id: user.id }
      expect(assigns(:user)).to eq user
    end

    it "assigns @time to be the current time" do
      user = User.create(password: "pw", first_name: "fn", last_name: "ln", email: "e")
      get :show, params: { id: user.id }
      expect(assigns(:time)).to be_kind_of Time
    end

    it "assigns @month to be the current month" do
      curr_month = Time.now.strftime("%m").to_i
      user = User.create(password: "pw", first_name: "fn", last_name: "ln", email: "e")
      get :show, params: { id: user.id }
      expect(assigns(:month)).to eq curr_month
    end

    it "renders the show template" do
      user = User.create(password: "pw", first_name: "fn", last_name: "ln", email: "e")
      get :show, params: { id: user.id }
      expect(response).to render_template("show")
    end
  end
end
