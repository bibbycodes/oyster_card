require 'station'

describe Station do
  context "When using the staton class" do
    it "should have a zone and name attribute" do
      expect(subject).to have_attributes(:zone => "", :name => "")
    end
  end
end