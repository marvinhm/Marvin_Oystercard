require 'journey'

describe Journey do
  let(:journey){ double :journey }
  let(:station){ double :station }
  let(:station_name){ double :station_name }
  # let(:journey){ {entry_station: entry_station, exit_station: exit_station} }

  describe '#touch_in' do
  it "Commences a journey" do
    # subject.top_up 1
    expect(journey.touch_in("Kings Cross")).to eq journey.in_journey
  end
end 

  it "allows a user to know where they've travelled from" do
    # subject.top_up 5
    allow(journey).to receive(:touch_in).and_return true 
    # journey.touch_in("Kings Cross")
    expect(journey.touch_in(station_name)).to eq true
  end

  describe '#touch_out' do
    it "Ends a journey" do
      # subject.top_up 5
      journey.touch_in("Kings Cross")
      journey.touch_out station
      expect(journey.in_journey).to eq false
    end

  it 'has an empty list of journeys by default' do
    expect(journey.all_journeys).to be_empty
  end

  # it 'stores a journey' do
  #   journey.touch_in(entry_station)
  #   journey.touch_out(exit_station)
  #   expect(journey.all_journeys).to include one_journey
  # end
 end 
end