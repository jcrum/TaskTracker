require 'rack/test'
require 'rspec'
require_relative '../app/main'

ENV['RACK_ENV'] = 'test'

module RSpecMixin
  include Rack::Test::Methods

  def app
    Api::Main
  end
end

RSpec.configure do |config|
  config.include RSpecMixin
end
