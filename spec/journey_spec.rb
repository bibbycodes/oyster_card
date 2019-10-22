require 'journey.rb'

describe Journey do
  let (:origin) {double (:station)}
  let (:destination) {double (:station)}

  context "When using the Journey class" do
    it "should be able to add an origin station" do
      subject.add_origin(origin)
      expect(subject.origin).to be(origin)
    end

    it "should be able to add an destination station" do
      subject.add_destination(destination)
      expect(subject.destination).to be(destination)
    end

    it "should return the minimum fare when calculating the fare" do
      subject.add_origin(origin)
      subject.add_destination(destination)

      expect(subject.calculate_fare).to eq(1)
    end
  end
end