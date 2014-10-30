require 'spec_helper'

describe Alephant::Scout::Url do
  describe '.valid?' do
    let(:response) { double('HTTParty::Response') }

    context 'using a valid URL' do
      let(:url) { 'http://a-valid-url.com' }
      before do
        allow(HTTParty).to receive(:head).once.with(url).and_return(response)
        allow(response).to receive(:code).once.and_return(200)
      end
      specify { expect(described_class.valid? url).to be }
    end

    context 'using a valid URL with a server error' do
      let(:url) { 'http://a-valid-url.com/error' }
      before do
        allow(HTTParty).to receive(:head).once.with(url).and_return(response)
        allow(response).to receive(:code).once.and_return(500)
      end
      specify { expect(described_class.valid? url).to be false}
    end

     context 'using a valid URL with a missing resource' do
      let(:url) { 'http://a-valid-url.com/missing.gif' }
      before do
        allow(HTTParty).to receive(:head).once.with(url).and_return(response)
        allow(response).to receive(:code).once.and_return(404)
      end
      specify { expect(described_class.valid? url).to be false}
    end

     context 'using an invalid URL' do
      let(:url) { 'http://an-invalid-url.com' }
      before do
        allow(HTTParty).to receive(:head).once.with(url).and_return(response)
        allow(response).to receive(:code).once.and_return(500)
      end
      specify { expect(described_class.valid? url).to be false}
    end
  end
end
