require 'DockingStation'

describe DockingStation do 
  let(:bike) { double :bike }
  it { is_expected.to respond_to :release_bike }

  it 'docks something' do
    expect(subject.dock(bike)).to include(bike) #changed from eq (bike) to --> include(bike) so that would pass part 14
  end 

  it { is_expected.to respond_to(:dock).with(1).argument }

  it 'returns docked bikes' do
    subject.dock(bike)
    expect(subject.bike).to eq bike
  end 

  # not sure if below is needed?

  it 'has a default capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  # not sure if above is needed?

  describe ' #release_bike' do
    let(:bike) { double :bike }
    it 'raises an error when there are no working bikes available' do
      # act -> report bike as broken then dock bike
      allow(bike).to receive(:broken?).and_return(true)
      # bike = double(:bike, broken?: true) <-- shorthand syntax if you had stub for bike being bike = double(:bike)
      subject.dock(bike)
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end

    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end
  end

  describe '#dock' do
    it 'raises an error when full' do
      subject.capacity.times { subject.dock double :bike } 
      expect { subject.dock double(:bike) }.to raise_error 'Docking station full'
    end
  end

  describe 'initialization' do

    subject { DockingStation.new }
    let(:bike) { double :bike }
    it 'defaults capacity' do
      described_class::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect{ subject.dock(bike) }.to raise_error 'Docking station full'
    end
  end
end