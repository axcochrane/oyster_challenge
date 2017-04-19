require 'oystercard'

describe Oystercard do
  subject(:oystercard) { described_class.new }

  it 'is initially not in a journey' do
    expect(subject).not_to be_in_journey
  end
    describe "#balance" do
      it "should return 0 balance" do
        expect(oystercard.balance).to eq(0)
      end
    end

    describe "#top_up" do
      it "Expects #top_up to change balance" do
        expect{oystercard.top_up(Oystercard::FARE)}.to change{ oystercard.balance }.by(Oystercard::FARE)
      end

      it "should raise error if top up breaches limit (£90)" do
        expect{oystercard.top_up(Oystercard::DEFAULT_LIMIT + 1)}.to raise_error "Top-up is over maximum balance #{oystercard.limit}"
      end
    end

    describe "#deduct" do
      it "responds to method call" do
        expect(oystercard.deduct).to respond_to
      end
    end
    describe '#in_journey?' do
      it "responds to method call" do
        expect(oystercard.in_journey?).to respond_to
      end
    end
    describe '#touch_in' do
      it "responds to method call" do
        oystercard.top_up(Oystercard::FARE)
        expect(oystercard.touch_in).to respond_to
      end
      it "it changes #in_journey to true" do
        oystercard.top_up(Oystercard::FARE)
        oystercard.touch_in
        expect(oystercard).to be_in_journey
      end
      it "raises error if funds below £1" do
      oystercard = Oystercard.new
      expect{oystercard.touch_in}.to raise_error "Funds too low"
    end
  end
    describe '#touch_out' do
      it "responds to method call" do
        expect(oystercard.touch_out).to respond_to
      end
      it "it changes #in_journey to false" do
        oystercard.touch_out
        expect(oystercard).not_to be_in_journey
      end
      it "deducts fare amount on touch out" do
        oystercard.top_up(10)
        oystercard.touch_in
        expect { oystercard.touch_out }.to change{oystercard.balance}.by(Oystercard::FARE)
      end
    end
end
