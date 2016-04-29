# Sendle::Api

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sendle-api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sendle-api

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it ( https://github.com/[my-github-username]/sendle-api/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Notes
### Development
1. Navigate to root of this project
2. Run bundle install to install the gems specified in sendle-api.gemspec
3. Run bundle exec rake spec to run the tests
4. After changes and ready to release, up the version
5. Then run bundle install on your testing project, in this case, Secondtake. Secondtake is installing the sendle-api gem using a local path, so we don't need to release the gem to RubyGems.
6. Once the gem is ready to be release, follow the instructions below.

### Release
1. Make sure you have a RubyGems.org account
2. bundle exec rake release

### Guide 
Based on this guide: https://quickleft.com/blog/engineering-lunch-series-step-by-step-guide-to-building-your-first-ruby-gem
