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
    host: "THIS-IS-THE-ENDPOINT"
  }
  …
)
```
