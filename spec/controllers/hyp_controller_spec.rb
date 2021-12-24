
require 'rails_helper'

RSpec.describe HypothesisController, type: :controller do
  describe 'GET #input' do
    it 'should return success' do
      get :input
      expect(response).to have_http_status(:success)
    end
  end
end
