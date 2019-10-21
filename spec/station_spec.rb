require 'station'

describe Station do
  context "When using the staton class" do
    it "should have a zone and name attribute" do
      station = Station.new(4, "Wembley")
      expect(station).to have_attributes(:zone => 4, :name => "Wembley")
    end
  end
end