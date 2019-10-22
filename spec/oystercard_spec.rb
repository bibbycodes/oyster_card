require 'oyster_card'

describe OysterCard do
  let (:origin) {double (:station)}
  let (:destination) {double (:destination)}

  context "When using the OysterCard Class" do

    context "Balance" do
      it "should have a balance of zero by default" do
        expect(subject.balance).to eq(0)
      end

      it "should raise an error if balance is less than the minimum amount" do
        expect{subject.touch_in(origin)}.to raise_error "Insufficient funds!"
      end

      it "should add specified amount of money" do
        subject.top_up(10)
        expect(subject.balance).to eq(10)
      end

      it "should have a max_balance" do
        expect{ subject.top_up(91) }.to raise_error "The maximum balance for an oyster card is £90"
      end

      it "should check if the balance is above the minimum" do
        subject.top_up(0.5)
        expect(subject.sufficient_funds?).to eq(false)
      end

    end

    context "Touching In" do

      it "should deduct the cost of a journey after touching out" do
        subject.top_up(5)
        subject.touch_in(origin)
        expect {subject.touch_out(destination)}.to change{subject.balance}.by(-1)
      end

      it "should be able to touch in during travel" do
        subject.top_up(5)
        subject.touch_in(origin)
        expect(subject.in_journey?).to be(true)
      end

      it "should register the station when touching in" do
        subject.top_up(5)
        subject.touch_in(origin)
        expect(subject.entry_station).to be(origin)
      end

    end

    context "Touching Out" do

      it "records start and end origins in journey history" do
        subject.top_up(5)
        subject.touch_in(origin)
        subject.touch_out(destination)
        expect(subject.current_journey.destination).to be(destination)
        expect(subject.current_journey.origin).to be(origin)
      end

      it "should be able to touch out during travel" do
        subject.touch_out(destination)
        expect(subject.in_journey?).to be(false)
      end

      it "should reset the value for entry origin when touching out" do
        subject.top_up(5)
        subject.touch_in(origin)
        subject.touch_out(destination)
        expect(subject.entry_station).to be(nil)
      end

    end

    it "should save the journey history" do
      subject.top_up(5)
      subject.touch_in(origin)
      subject.touch_out(destination)
      expect(subject.journey_history).to include(subject.current_journey)
    end
  end
end

