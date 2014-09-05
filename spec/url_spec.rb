require "spec_helper"

describe Alephant::Scout::Url do
  describe ".valid?(url)" do
    it "returns an HTTP response as a result of an HTTP HEAD request to the URL" do
      expect(subject.valid?('http://www.bbc.co.uk/persian')).to be true
      expect(subject.valid?('http://www.bbc.co.uk/persian/world/2014/09/140905_l03_iraq_baghdad_bombing')).to be true
      expect(subject.valid?('http://www.bbc.co.uk/persian/hatstand')).to be false
    end
  end
end
