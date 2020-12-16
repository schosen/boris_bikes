require 'Bike'

describe Bike do 
  it { is_expected.to respond_to :working? }

  it 'can be broken' do
    subject.report_broken
    expect(subject).to be_broken
  end
end