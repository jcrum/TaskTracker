# frozen_string_literal: true

require 'sinatra/base'

require_relative 'environment_config'
require_relative 'controllers/general'

module Api
  # Main "Controller for the Applications"
  class Main < ::Sinatra::Base
    # Include all the environment configurations
    register EnvironmentConfig
    # Include the General/Base contoller
    register Controllers::General
  end # end module Main
end # end module Api
