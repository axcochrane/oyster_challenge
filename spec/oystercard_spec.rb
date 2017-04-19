require 'oystercard'

describe Oystercard do
  subject(:oystercard) { described_class.new }
    describe "#balance" do
      it "should return 0 balance" do
        expect(oystercard.balance).to eq(0)
      end
    end

    describe "#top_up" do
      it "Expects #top_up to change balance" do
        expect{oystercard.top_up(10)}.to change{ oystercard.balance }.by(10)
      end

      it "should raise error if top up breaches limit (£90)" do
        expect{oystercard.top_up(91)}.to raise_error "Top-up is over maximum balance #{oystercard.limit}"
      end
    end

    describe "#deduct" do
      it "responds to method call" do
        expect(oystercard.deduct).to respond_to
      end
    end
    describe '#in_journey?' do
      it "responds to method call" do
        expect(oystercard.journey?).to respond_to
      end
    end
    describe '#touch_in' do
      it "responds to method call" do
        expect(oystercard.touch_in).to respond_to
      end 
    end
end
