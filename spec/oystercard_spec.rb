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

    it "should have a max_balance of 90" do
      expect{ subject.top_up(91) }.to raise_error "The maximum balance for an oyster card is £90"
    end

    it "should deduct from balance when card is used" do
      subject.deduct(10)
      expect(subject.balance).to eq(-10)
    end
  end
end

