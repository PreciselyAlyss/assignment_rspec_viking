require 'spec_helper'
require_relative '../lib/viking.rb'

describe Viking do

  let(:viking) { described_class.new }
  let(:oleg) { Viking.new("Oleg") }
  let(:sven) { Viking.new("Sven") }
  let(:axe) { Axe.new }

  describe '#initialize' do
    it 'knows the name of a viking' do
      expect(oleg.name).to eq("Oleg")
    end

    it 'shows the viking as having a starting health of 100' do
      expect(oleg.health).to eq(100)
    end

    it 'does not change the health value' do
      expect{ oleg.health = 120 }.to raise_error(NoMethodError)
    end

    it 'shows the viking as having no weapon' do
      expect(oleg.weapon).to be_nil
    end
  end

  describe '#attack' do
    subject { oleg.attack(sven) }

    it 'causes the receipient\'s health to drop' do 
      subject
      expect(sven.health).to be < 100
    end

    # this description should be human readable and not this
    it 'causes the receipient to call the take_damage method' do
      # 2.5 because that is the damage when strength is 100 and weapon is fists
      expect(sven).to receive(:take_damage).with(2.5)
      subject
    end

    # I feel that these 4 tests require testing private methods which isn't 
    # recommended within the curriculum. I am omitting them for that reason.
    #it 'has the viking use their fists if they aren\'t holding a weapon'
    #it 'uses strength to determine weapon damage when fists are used'
    #it 'damage_with_weapon method called if the viking uses a weapon'
    #it 'uses strength and weapon multiple to determine weapon dmg when a weapon is used'

    it 'checks if arrows are gone and uses fists instead of bow' #do
      #oleg.pick_up_weapon(Bow.new(0))
      #expect { subject }.to raise_exception
    #end
  end

  describe '#receive_attack' do
    subject { oleg.receive_attack(damage) }
    let(:damage) { rand(1..10) }

    it 'reduces victim\'s health when attacked' do
      subject
      expect(oleg.health).to be < 100
    end

    it 'calls the take_damage method' do
      expect(oleg).to receive(:take_damage).with(damage)
      subject
    end
  end

  describe '#pick_up_weapon' do

    it 'sets new weapon when it is picked up' do
      oleg.pick_up_weapon(axe)
      expect(oleg.weapon).to eq(axe)
    end

    it 'prevents non-weapons from being picked up' do
      expect { oleg.pick_up_weapon("pebble") }.to raise_error("Can't pick up that thing")
    end
  end

  describe '#drop_weapon' do
    before do
      oleg.pick_up_weapon( Axe.new )
    end

    it 'removes weapon from viking when dropped' do
      oleg.drop_weapon
      expect(oleg.weapon).to be_nil
    end
  end
  
end
