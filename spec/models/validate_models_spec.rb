require 'rails_helper'

RSpec.describe HypothesisController, type: :model do
  before(:each) do
    Number.delete_all
    Result.delete_all
  end

  it 'Should not validate model' do
    number = Number.new(number: 'abc')
    expect(number).not_to be_valid
  end

  it 'Should not validate model' do
    number = Result.new(result: 'abc', iteration: 'def')
    expect(number).not_to be_valid
  end

  it 'Should create database string' do
    expect do
      Number.create!(number: 3)
    end.to change { Number.count }.from(0).to(1)
  end
end
