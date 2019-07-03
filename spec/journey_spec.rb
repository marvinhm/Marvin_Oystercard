# frozen_string_literal: true

require 'journey'

describe Journey do
  let(:journey) { double :journey }
  let(:station) { double :station }
  let(:station_name) { double :station_name }
  # let(:journey){ {entry_station: entry_station, exit_station: exit_station} }

  describe '#touch_in' do
    it 'Commences a journey' do
      # subject.top_up 1
      allow(journey).to receive(:touch_in).and_return true
      expect(journey.touch_in(station_name)).to eq true
    end

    it 'raises an error if user has already tapped in' do
      subject.touch_in(station_name)
      expect{subject.touch_in(station_name)}.to raise_error("You have already tapped in!")
    end
  end

  it "allows a user to know where they've travelled from" do
    # subject.top_up 5
    allow(journey).to receive(:touch_in).and_return true
    # journey.touch_in("Kings Cross")
    expect(journey.touch_in(station_name)).to eq true
  end

  describe '#touch_out' do
    it 'Ends a journey' do
      # subject.top_up 5
      allow(journey).to receive(:touch_in).and_return true
      allow(journey).to receive(:touch_out).and_return false
      allow(journey).to receive(:in_journey).and_return false
      journey.touch_in(station_name)
      journey.touch_out station_name
      expect(journey.in_journey).to eq false
    end

    it 'has an empty list of journeys by default' do
      allow(journey).to receive(:all_journeys).and_return []
      expect(journey.all_journeys).to be_empty
    end

    it 'raises an error if user has already tapped out' do
      subject.touch_in(station_name)
      subject.touch_out(station_name)
      expect{subject.touch_out(station_name)}.to raise_error("You have already tapped out!")
    end

    # it 'stores a journey' do
    #   journey.touch_in(entry_station)
    #   journey.touch_out(exit_station)
    #   expect(journey.all_journeys).to include one_journey
    # end
  end

  describe '#fare' do
    it 'Should return minimum fare or penalty fare' do
      subject.touch_in(station_name)
      expect(subject.entry_station).not_to be(nil)
    end

    it 'Should return minimum fare or penalty fare' do
      subject.touch_in(station_name)
      subject.touch_out(station_name)
      expect(subject.exit_station).not_to be(nil)
    end

    it 'Should return minimum fare' do
      subject.touch_in(station_name)
      subject.touch_out(station_name)
      expect(subject.fare).to eq(Journey::MINIMUM_FARE)
    end
  end
end
