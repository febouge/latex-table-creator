require 'simplecov'
SimpleCov.start 'rails' do
  add_filter '/test/'
end
if ENV['CI'] == 'true'
  require 'codecov'
  SimpleCov.formatter = SimpleCov::Formatter::Codecov
end

require 'test/unit'

class Test::Unit::TestCase
end
