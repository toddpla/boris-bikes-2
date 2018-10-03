require 'docking_station'
require 'bike'

describe DockingStation do

  it { is_expected.to respond_to :release_bike }

  it 'releases working bike' do
    bike = subject.release_bike
    expect(bike).to be_working
  end
  it 'should dock bike' do
    subject.dock(Bike.new)
    expect(subject.bikes.length).to eq(1)
  end
  it 'should show bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.show(0)).to eq(bike)
  end
end
