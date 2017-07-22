require 'spec_helper'
require_relative '../lib/warmup.rb'

describe Warmup do

  let(:warmup){ Warmup.new }

  describe '#gets_shout' do
    it 'uses shout to get and return a string' do
      allow(warmup).to receive(:gets).and_return("ECHO")
      expect(warmup.gets_shout).to eq("ECHO")
    end
  end


  describe '#triple_size' do
    it 'multiply the contents of the array by a factor of 3' do
      expect(warmup.triple_size([1, 2, 3])).to eq(9)
    end
  end

  describe '#calls_some_methods' do
    it 'tests a string being passed as an arguemnt' do
      expect(warmup.calls_some_methods("string")).to eq("I am unrelated")
    end
  end

end
