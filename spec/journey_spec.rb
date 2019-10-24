require 'journey.rb'

describe Journey do
  let (:origin) {double (:station)}
  let (:destination) {double (:station)}

  context "Journey" do

    it "adds a destination station" do
      subject.add_destination(destination)
      expect(subject.destination).to be(destination)
    end

    it "returns the minimum fare when calculating the fare" do
      subject.add_origin(origin)
      subject.add_destination(destination)
      expect(subject.calculate_fare).to eq(1)
    end

    it "knows if the journey is not complete" do 
      expect(subject.complete?).to eq(false)
    end

    it "has a penalty fair by default" do
      expect(subject).to have_attributes(:fare => Journey::PENALTY_FARE)
    end

    it "returns itself when ending a journey" do
      expect(subject.end_journey).to eq(subject)
    end

    context "Given an entry station" do
      it "has an origin" do
        subject.add_origin(origin)
        expect(subject.origin).to be(origin)
      end

      it "returns the Penalty Fare when a journey is incomplete" do
        subject.add_destination(destination)
        expect(subject.calculate_fare).to eq(Journey::PENALTY_FARE)
      end
    end
  end
end