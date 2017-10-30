RSpec.describe UsersController do
  describe "POST create" do
    it "returns a 201 http status" do
      post :create, :user =>{ password: "pw", first_name: "fn", last_name: "ln", email: "e" }
      expect(response.status).to eq 201
    end

    it "creates a new user" do
      expected_user_count = User.count + 1
      post :create, :user => { password: "pw", first_name: "fn", last_name: "ln", email: "e" }
      expect(User.count).to eq expected_user_count
    end
  end
end
