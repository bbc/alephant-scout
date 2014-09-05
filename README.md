# Alephant::Scout

This is a gem to allow Alephant based applications to check the validity of an arbitrary URL / URI
before enqueuing messages to render content based on the content of said URL / URI, thereby protecting
render nodes from having to handle bogus URLs / URIs.

## Installation

Add this line to your application's Gemfile:

    gem 'alephant-scout'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install alephant-scout

## Usage

```rb
require 'alephant-scout'

# => true

good_url = 'http://www.bbc.co.uk/persian/world'

# => "http://www.bbc.co.uk/persian/world"

bad_url = 'http://www.bbc.co.uk/persian/lobster-hatstand'

# => "http://www.bbc.co.uk/persian/lobster-hatstand"

url_scout = Alephant::Scout::Url.new()

# = > #<Alephant::Scout::Url:[ObjectId]>

url_scout.valid?(good_url)

# => true

url_scout.valid?(bad_url)

# => false
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
