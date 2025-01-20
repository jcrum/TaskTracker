require 'sinatra/base'
require 'sinatra/config_file'

module Api
  class Main < ::Sinatra::Base
    register Sinatra::ConfigFile


    configure :development do
      set :host_authorization, { permitted_hosts: [] }
    end

    config_file File.join(File.dirname(__FILE__), '../config/config.yml')
   
    get '/' do
      "Welcome to #{settings.app_name}"
    end

  end # end module Main
end # end module Api
