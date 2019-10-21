require 'oyster_card'

describe OysterCard do
  context "When using the OysterCard Class" do
    it "should have a balance of zero by default" do
      expect(subject.balance).to eq(0)
    end
  end
end
