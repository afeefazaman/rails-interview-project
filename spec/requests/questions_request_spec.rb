require 'rails_helper'

RSpec.describe "question request", type: :request do
  describe "GET index" do
    it "returns a bad request without an api_key" do
      get questions_path

      expect(response.status).to eq(401)
    end

    it "returns a success response with an api_key" do
      tenant = create(:tenant)

      get questions_path, params: {}, headers: { 'HTTP_API_KEY' => tenant.api_key,  }, xhr: true

      expect(response.status).to eq(200)
    end
  end
end
