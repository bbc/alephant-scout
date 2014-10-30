require "httparty"

module Alephant
  module Scout
    module Url
      def self.valid?(url)
        HTTParty.head(url).code == 200
      rescue
        false
      end
    end
  end
end
