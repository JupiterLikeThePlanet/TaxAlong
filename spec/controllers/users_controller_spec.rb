RSpec.describe UsersController do
  describe "GET edit" do
    it "returns a 200 http status" do
      user = User.create(password: "pw", first_name: "fn", last_name: "ln", email: "e")
      get :edit, id: user.id
      expect(response.status).to eq 200
    end

    it "assigns the requested user to @user" do
      user = User.create(password: "pw", first_name: "fn", last_name: "ln", email: "e")
      get :edit, id: user.id
      expect(assigns(:user)).to eq user
    end

    it "renders the edit template" do
      user = User.create(password: "pw", first_name: "fn", last_name: "ln", email: "e")
      get :edit, params: { id: user.id }
      expect(response).to render_template("edit")
    end
  end
end
