require 'rails_helper'

RSpec.describe HypothesisController, type: :routing do
  describe 'Routing' do
    it 'should routes to input' do
      expect(get('/')).to route_to('hypothesis#input')
    end
  end
end
