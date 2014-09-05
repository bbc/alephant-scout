require 'spec_helper'

describe Alephant::Scout::Url do
  describe ".valid?(url)" do
    it "is a valid url" do
      response = double('HTTParty::Response', :code => 200)
      allow(HTTParty).to receive(:head).and_return(response)
      expect(subject.valid?('http://www.avalidurl.com')).to be true
    end

    it "is a valid url with an issue" do
      response = double('HTTParty::Response', :code => 500)
      allow(HTTParty).to receive(:head).and_return(response)
      expect(subject.valid?('http://www.notavalidurl.com')).to be false
    end

    it "is an invalid URL - i.e. host is resolved but resource does not exist" do
      response = double('HTTParty::Response', :code => 404)
      allow(HTTParty).to receive(:head).and_return(response)
      expect(subject.valid?('http://www.avalidurl.com/but/a/nonexistent/resource')).to be false
    end

    it "is an invalid host - i.e. no DNS resolution" do
      response = double('HTTParty::Response', :code => 500)
      allow(HTTParty).to receive(:head).and_raise("Hostname not found")
      expect(subject.valid?('test://www.notavalidurl.test')).to be false
    end
  end
end
