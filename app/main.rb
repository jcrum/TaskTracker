# frozen_string_literal: true

require 'sinatra/base'
require 'semantic_logger'
require 'json'

$LOAD_PATH.push __dir__
require 'environment_config'
require 'controllers/general'

module Api
  # Main "Controller for the Applications"
  class Main < ::Sinatra::Base
    # Include all the environment configurations
    register EnvironmentConfig

    set :logger, SemanticLogger['TaskManager']

    logger.debug('Loaded environment configuration')
    # Include the General/Base contoller
    register Controllers::General
  end # end module Main
end # end module Api
