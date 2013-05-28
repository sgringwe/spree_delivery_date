# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_delivery_date'
  s.version     = '1.3.2'
  s.summary     = 'Adds a delivery date field in the delivery section of checkout'
  s.description = 'Adds a delivery date field in the delivery section of the checkout. Allows admin to view that delivery date in the order details.'
  s.required_ruby_version = '>= 1.8.7'

  s.author    = 'Scott Ringwelski'
  s.email     = 'sgringwe@mtu.edu'
  s.homepage  = 'http://www.spreecommerce.com'

  #s.files       = `git ls-files`.split("\n")
  #s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '~> 2.0.0'

  s.add_development_dependency 'capybara', '~> 1.1.2'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'factory_girl', '~> 2.6.4'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 2.9'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'sqlite3'
end
