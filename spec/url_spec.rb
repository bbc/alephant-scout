require 'spec_helper'

describe Alephant::Scout::Url do
  describe ".valid?(url)" do
    let(:response) { double('HTTParty::Response') }
    it "is a valid url" do
      allow(response).to receive(:code).and_return(200)
      allow(HTTParty).to receive(:head).and_return(response)
      expect(subject.valid?('http://www.avalidurl.com')).to be true
    end

    it "is a valid url with an issue" do
      allow(response).to receive(:code).and_return(500)
      allow(HTTParty).to receive(:head).and_return(response)
      expect(subject.valid?('http://www.notavalidurl.com')).to be false
    end

    it "is an invalid URL - i.e. host is resolved but resource does not exist" do
      allow(response).to receive(:code).and_return(404)
      allow(HTTParty).to receive(:head).and_return(response)
      expect(subject.valid?('http://www.avalidurl.com/but/a/nonexistent/resource')).to be false
    end

    it "is an invalid host - i.e. no DNS resolution" do
      allow(response).to receive(:code).and_return(500)
      allow(HTTParty).to receive(:head).and_raise("Hostname not found")
      expect(subject.valid?('test://www.notavalidurl.test')).to be false
    end
  end
end
