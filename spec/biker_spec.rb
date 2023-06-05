require 'spec_helper'

RSpec.describe Biker do
  before(:each) do
    @biker = Biker.new('Kenny', 30)
    @ride1 = Ride.new({name: "Walnut Creek Trail", distance: 10.7, loop: false, terrain: :hills})
    @ride2 = Ride.new({name: "Town Lake", distance: 14.9, loop: true, terrain: :gravel})
  end

  describe '#initialize' do
    it 'can initialize' do
      expect(@biker).to be_a(Biker)
    end

    it 'can have a name' do
      expect(@biker.name).to eq('Kenny')
    end

    it 'can have a max distance' do
      expect(@biker.max_distance).to eq(30)
    end
  end

  describe '#rides' do
    it 'can log rides in a hash' do
      expect(@biker.rides).to eq({})
    end
  end

  describe '#acceptable_terrain' do
    it 'has a list of acceptable terrain' do
      expect(@biker.acceptable_terrain).to eq([])
    end
  end

  describe '#learn_terrain(terrain)' do
    it 'can add terrain to acceptable_terrain' do
      expect(@biker.acceptable_terrain).to eq([])
      @biker.learn_terrain(:gravel)
      @biker.learn_terrain(:hills)
      expect(@biker.acceptable_terrain).to eq([:gravel, :hills])
    end
  end

  describe '#log_ride(ride, time)' do
    it 'can log a ride in rides hash with the ride and time as key value pairs' do
      expect(@biker.rides).to eq({})
      @biker.learn_terrain(:gravel)
      @biker.learn_terrain(:hills)
      @biker.log_ride(@ride1, 92.5)
      @biker.log_ride(@ride1, 91.1)
      @biker.log_ride(@ride2, 60.9)
      @biker.log_ride(@ride2, 61.6)
      expect(@biker.rides).to eq( {
                              @ride1 => [92.5, 91.1],
                              @ride2 => [60.9, 61.6]
                              })
    end
  end

  describe '#personal_record(ride)' do
    it 'returns the fastest time for the given ride' do
      @biker.learn_terrain(:gravel)
      @biker.learn_terrain(:hills)
      @biker.log_ride(@ride1, 92.5)
      @biker.log_ride(@ride1, 91.1)
      @biker.log_ride(@ride2, 60.9)
      @biker.log_ride(@ride2, 61.6)
      expect(@biker.personal_record(@ride)).to eq(91.1)
      expect(@biker.personal_record(@ride2)).to eq(60.9)
    end
  end
end