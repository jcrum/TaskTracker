require 'sinatra/base'

require_relative 'environment_config'
require_relative 'controllers/general'

module Api
  class Main < ::Sinatra::Base
    register EnvironmentConfig

    register Controllers::General


    configure :development do
      set :host_authorization, { permitted_hosts: [] }
    end



  end # end module Main
end # end module Api
