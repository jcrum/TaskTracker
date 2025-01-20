require 'sinatra/base'

require_relative 'environment_config'
require_relative 'controllers/general'

module Api
  class Main < ::Sinatra::Base
    register EnvironmentConfig
    register Controllers::General

  end # end module Main
end # end module Api
