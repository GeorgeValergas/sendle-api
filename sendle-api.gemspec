# -*- encoding: utf-8 -*-
# stub: sendle-api 0.0.13 ruby lib

Gem::Specification.new do |s|
  s.name = "sendle-api".freeze
  s.version = "0.0.13"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Bobby Lei".freeze]
  s.date = "2016-11-01"
  s.description = "Sendle allows businesses to send parcels door to door for low flat-rates Australia wide. See https://www.sendle.com for details.".freeze
  s.email = ["bobl53@gmail.com".freeze]
  s.files = [".gitignore".freeze, "Changelog.md".freeze, "Gemfile".freeze, "LICENSE.txt".freeze, "README.md".freeze, "Rakefile".freeze, "lib/sendle/api.rb".freeze, "lib/sendle/api/actions/base.rb".freeze, "lib/sendle/api/actions/create.rb".freeze, "lib/sendle/api/actions/destroy.rb".freeze, "lib/sendle/api/actions/index.rb".freeze, "lib/sendle/api/actions/show.rb".freeze, "lib/sendle/api/constants.rb".freeze, "lib/sendle/api/errors/invalid_plan.rb".freeze, "lib/sendle/api/errors/missing_api_key.rb".freeze, "lib/sendle/api/errors/missing_params.rb".freeze, "lib/sendle/api/errors/missing_sendle_id.rb".freeze, "lib/sendle/api/errors/payment_required.rb".freeze, "lib/sendle/api/errors/precondition_failed.rb".freeze, "lib/sendle/api/errors/unauthorized.rb".freeze, "lib/sendle/api/errors/unprocessable_entity.rb".freeze, "lib/sendle/api/factories/errors.rb".freeze, "lib/sendle/api/order.rb".freeze, "lib/sendle/api/ping.rb".freeze, "lib/sendle/api/quote.rb".freeze, "lib/sendle/api/resource.rb".freeze, "lib/sendle/api/responses/json.rb".freeze, "lib/sendle/api/responses/pong.rb".freeze, "lib/sendle/api/sugars/create.rb".freeze, "lib/sendle/api/sugars/destroy.rb".freeze, "lib/sendle/api/sugars/index.rb".freeze, "lib/sendle/api/sugars/show.rb".freeze, "lib/sendle/api/tracking.rb".freeze, "lib/sendle/api/utils.rb".freeze, "lib/sendle/api/version.rb".freeze, "sendle-api.gemspec".freeze, "spec/sendle/api/order_spec.rb".freeze, "spec/sendle/api/ping_spec.rb".freeze, "spec/sendle/api/quote_spec.rb".freeze, "spec/sendle/api_spec.rb".freeze, "spec/sendle/errors/missing_params_spec.rb".freeze, "spec/spec_helper.rb".freeze, "spec/support/helpers.rb".freeze, "spec/support/shared_examples/with_credentials_spec.rb".freeze, "tasks/rspec.rake".freeze]
  s.homepage = "http://api-doc.sendle.com".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.6".freeze
  s.summary = "Ruby bindings for the Sendle API".freeze
  s.test_files = ["spec/sendle/api/order_spec.rb".freeze, "spec/sendle/api/ping_spec.rb".freeze, "spec/sendle/api/quote_spec.rb".freeze, "spec/sendle/api_spec.rb".freeze, "spec/sendle/errors/missing_params_spec.rb".freeze, "spec/spec_helper.rb".freeze, "spec/support/helpers.rb".freeze, "spec/support/shared_examples/with_credentials_spec.rb".freeze]

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.7"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_development_dependency(%q<require_all>.freeze, [">= 0"])
      s.add_development_dependency(%q<byebug>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<rest-client>.freeze, [">= 0"])
    else
      s.add_dependency(%q<bundler>.freeze, ["~> 1.7"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_dependency(%q<require_all>.freeze, [">= 0"])
      s.add_dependency(%q<byebug>.freeze, [">= 0"])
      s.add_dependency(%q<rest-client>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.7"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
    s.add_dependency(%q<require_all>.freeze, [">= 0"])
    s.add_dependency(%q<byebug>.freeze, [">= 0"])
    s.add_dependency(%q<rest-client>.freeze, [">= 0"])
  end
end
