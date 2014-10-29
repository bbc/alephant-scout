require 'spec_helper'

describe Alephant::Scout::Url do
  describe '.valid?' do
    context 'using a valid URL' do
      let(:url) { 'http://bbc.co.uk/persian/world' }
      specify { expect(described_class.valid? url).to be }
    end

    context 'using an invalid URL' do
      let(:url) { 'http://bbc.co.uk/batman' }
      specify { expect(described_class.valid? url).to be false}
    end
  end
end
