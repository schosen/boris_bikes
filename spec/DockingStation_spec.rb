require 'DockingStation'

describe DockingStation do 
  it { is_expected.to respond_to :release_bike }

  it 'docks something' do
    bike = Bike.new

    expect(subject.dock(bike)).to include(bike) #changed from eq (bike) to --> include(bike) so that would pass part 14
  end 

  it 'returns docked bikes' do
    bike = Bike.new
    subject.dock(bike)

    expect(subject.bike).to eq bike
  end 

  describe ' #release_bike' do
    it 'raises an error when there are no bikes available' do

      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end

  describe '#dock' do
    it 'raises an error when full' do
      20.times { subject.dock Bike.new }
      expect { subject.dock Bike.new }.to raise_error 'Docking station full'
    end
  end
end