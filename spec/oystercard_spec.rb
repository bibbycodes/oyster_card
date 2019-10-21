require 'oyster_card'

describe OysterCard do
  context "When using the OysterCard Class" do
    it "should have a balance of zero by default" do
      expect(subject.balance).to eq(0)
    end

    it "should add specified amount of money" do
      subject.top_up(10)
      expect(subject.balance).to eq(10)
    end

    it "should have a max_balance" do
      expect{ subject.top_up(91) }.to raise_error "The maximum balance for an oyster card is £90"
    end

    it "should deduct from balance when card is used" do
      subject.deduct(10)
      expect(subject.balance).to eq(-10)
    end

    it "should be able to touch in during travel" do
      subject.top_up(5)
      subject.touch_in
      expect(subject.in_journey?).to be(true)
    end

    it "should be able to touch out during travel" do
      subject.touch_out
      expect(subject.in_journey?).to be(false)
    end

    it "should check if the balance is above the minimum" do
      subject.top_up(0.5)
      expect(subject.above_minimum?).to eq(false)
    end

    it "should raise an error if balance is less than minimum amount" do
      expect{subject.touch_in}.to raise_error "Insufficient funds!"
    end
  end
end

