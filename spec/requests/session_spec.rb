require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/session/index"
      expect(response).to have_http_status(:success)
    end
  end

end
