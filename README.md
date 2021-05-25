# Geocoder::Studitemps

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'geocoder-studitemps'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install geocoder-studitemps

## Usage
e.g. in `config/initializers/geocoder.rb` in Rails projects

```ruby
Geocoder.configure(
  lookup: :studitemps,
  studitemps: {
    host: "THIS-IS-THE-ENDPOINT",
    cache_store: ActiveSupport::Cache::MemoryStore.new, # uses the ActiveSupport::Cache::Store API
    auth0: {
      client_id: "CLIENT_ID",
      client_secret: "CLIENT_SECRET",
      site: "SITE",
      audience: "AUDIENCE"
    }
  }
  …
)
```
