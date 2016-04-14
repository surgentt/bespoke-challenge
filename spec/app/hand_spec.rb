require_relative '../spec_helper'

describe Hand do

  let(:hand) {Hand.new}

  it '#hello should return a string' do
    expect(hand.hello).to eq('Hello!')
  end

end