# Sendle::Api

The Sendle API Ruby bindings provide a small SDK for convenient access to the Sendle API from applications written with the Ruby language.

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

Before you can use the Sendle API, you need to sign up for a Sendle account. Once you have signed up, you need to send an email to Sendle support requesting access to their API. When access has been granted, you will have access to your sendle_id and api_key, both which are required to access the api.

If you are accessing the Sendle API in sandbox mode, you need to repeat the above process on Sendle's sandbox servers.

### Configuration

Before you can start using the library, you need to configure your api credentials. The instructions below assume you are using this library from a Rails application.

Create a file called 'sendle.rb' inside your config/initializers directory with the following content:
```
Sendle::Api.api_key = Rails.application.secrets.sendle_api_key 
Sendle::Api.sendle_id = Rails.application.secrets.sendle_id
Sendle::Api.sandbox = true #Only if you are accessing the Sendle sandbox servers, otherwise take out this line.
```

### Making a Request

Sendle's API documentation can be found here: http://sendle.github.io/sendle-api-doc.

#### Pinging the API
```
Sendle::Api::Ping.execute
```

Returns an instance of Sendle::Api::Responses::Pong upon a successful response from the API. 

#### Getting a Delivery Quote
```
params = { pickup_suburb: 'woolloomooloo',
           pickup_postcode: '2011',
           delivery_suburb: 'eastgardens',
           delivery_postcode: '2036',
           kilogram_weight: '1'
         }
response = Sendle::Api::Quote.execute(params)

puts response.json #a hash 
```

Returns an instance of Sendle::Api::Responses::Json upon a successful response. 

#### Errors
Any of the methods described above can throw errors. Check the Sendle API docs for a list of errors and how to resolve them. 


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
