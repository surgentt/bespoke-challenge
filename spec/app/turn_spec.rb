require_relative '../spec_helper'

describe Turn do

  let(:turn) {Turn.new}

  it '#hello should return a string' do
    expect(turn.hello).to eq('Hello!')
  end

end