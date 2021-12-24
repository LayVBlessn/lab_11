require 'rails_helper'

RSpec.describe HypothesisController do
  it 'should get array with length = 4' do
    arr = HypothesisController.new.send :proccessor, 174
    expect(arr.length).to eq(4)
  end

end
