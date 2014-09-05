require "httparty"

module Alephant
  module Scout
    class Url
      def valid?(url_to_scout)
        HTTParty.head(url_to_scout).code == 200
      rescue
        false
      end
    end
  end
end
