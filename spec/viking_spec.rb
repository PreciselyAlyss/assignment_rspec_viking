require 'spec_helper'
require_relative '../lib/viking.rb'

describe Viking do

  # TODO: Create two players
  let(:viking){ described_class.new }
  let(:oleg){ Viking.new("Oleg") }
  let(:sven){ Viking.new("Sven")}

  describe '#initialize' do
    it 'should know the name of a viking' do
      expect(oleg.name).to eq("Oleg")
    end

    it 'should show the viking as having a starting health of 100' do
      expect(oleg.health).to eq(100)
    end

    it 'should not allow the health value to be changed' do
      expect{ oleg.health = 120 }.to raise_error(NoMethodError)
    end

    it 'should show the viking as having no weapon' do
      expect(oleg.weapon).to be_nil
    end
  end

  describe '#attack' do
    it 'causes the receipient\'s health to drop' do 
      #expect{ sven.attack(oleg) }
    end

    # this description should be human readable and not this
    it 'causes the receipient to call the take_damage method' do
      # stuff here
    end

    it 'has the viking use their fists if they aren\'t holding a weapon' do
      # stuff here
    end

    it 'uses strength to determine weapon damage when fists are used' do
      # stuff here
    end

    # should be human readable
    it 'calls the damange_with_weapon method if the viking uses a weapon' do
      # stuff here
    end 

    it 'uses strength and weapon multiple to determine weapon dmg when a weapon is used' do
      # stuff here
    end

    it 'checks if arrows are gone and uses fists instead of bow' do
      # stuff here
    end
  end

  describe '#receive_attack' do
    it 'reduces victim\'s health when attacked' do
      # stuff here
    end

    it 'calls the take_damage method' do
      allow(viking.receive_attack).to receive(:take_damage).and_return(:damage_dealth => 5)
      expect(viking.receive_attack).to receive(:take_damage)
    end
  end

  describe '#pick_up_weapon'
  
end
