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

Alephant::Scout::Url.valid? 'http://bbc.co.uk/persian/world'
# => true

Alephant::Scout::Url.valid? 'http://bbc.co.uk/batman'
# => false
```

## Contributing

1. [Fork it!](https://github.com/bbc-news/alephant-scout/fork)
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Create new [Pull Request](https://github.com/bbc-news/alephant-scout/pulls).
