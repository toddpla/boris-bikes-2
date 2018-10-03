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
  end


  it 'should dock bike' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq(bike)
  end

  it 'should show bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq(bike)
  end

  it "raises an error if no more bikes" do
    expect { subject.release_bike }.to raise_error 'No bikes available'
  end

  it "raises an error if docking station is full" do
    bike = Bike.new
    subject.dock(bike)
    expect { subject.dock(bike) }.to raise_error 'Docking station full'
  end

end
