require_relative '../lib/weapons/bow.rb'
require 'spec_helper'

describe Bow do
  let(:bow) { Bow.new }

  describe '#initialize' do

    it 'has a 10 arrows by default' do
      expect(bow.arrows).to eq(10)
    end
    
    it 'has 7 arrows when created with 7 arrows' do
      nbow = Bow.new(7)
      expect(nbow.arrows).to eq(7)
    end
  end

  describe '#use' do

    it 'reduces arrow count by one when used' do
      bow.use
      expect(bow.arrows).to eq(9)
    end 

    it 'raises error if there are no more arrows' do
      bowz = Bow.new(0)
      expect { bowz.use }.to raise_error("Out of arrows")
    end
  end
end
