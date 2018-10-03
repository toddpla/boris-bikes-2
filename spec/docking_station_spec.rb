require 'docking_station'
require 'bike'

describe DockingStation do

  it { is_expected.to respond_to :release_bike }

  describe '#release_bike' do
    it 'releases working bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it "doesn't release broken bike" do
      bike = Bike.new
      bike.broken = true
      subject.dock(bike)
      bike_two = Bike.new
      bike_two.broken = false
      subject.dock(bike_two)
      expect(subject.release_bike).to eq bike_two
    end

  end

  describe '#dock' do
    it 'should dock bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.bikes).to eq([bike])
    end

    it 'should show bikes' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.bikes).to eq([bike])
    end

    it "raises an error if no more bikes" do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end

    it "raises an error if docking station is full" do
      bike = Bike.new
      DockingStation::DEFAULT_CAPACITY.times { subject.dock(bike) }
      expect { subject.dock(bike) }.to raise_error 'Docking station full'
    end

    it 'should capture broken bike status' do
      broken = true
      bike = Bike.new
      bike.broken = broken
      subject.dock(bike)
      expect(subject.bikes[0].broken).to eq broken
    end

  end

  describe '#initialize' do

    it 'should initialize with given capacity' do
      docking_station = DockingStation.new(50)
      expect(docking_station.capacity).to eq(50)
    end

    it 'should initialize with default capacity given no capacity' do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end

  end



end
