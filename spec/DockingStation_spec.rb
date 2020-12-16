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

  # not sure if below is needed?

  it 'has a default capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  # not sure if above is needed?

  describe ' #release_bike' do
    it 'raises an error when there are no working bikes available' do
      # arrange -> add new station and bike
      bike = Bike.new
      # act -> report bike as broken then dock bike
      bike.report_broken
      subject.dock(bike)
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end

  end

  describe '#dock' do
    it 'raises an error when full' do
      subject.capacity.times { subject.dock Bike.new } 
      expect { subject.dock Bike.new }.to raise_error 'Docking station full'
    end
  end

  describe 'initialization' do

    subject { DockingStation.new }
    let(:bike) { Bike.new }
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect{ subject.dock(bike) }.to raise_error 'Docking station full'
    end
  end
end