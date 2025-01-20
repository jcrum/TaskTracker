require 'sinatra/base'
require 'sinatra/config_file'

require_relative 'controllers/general'

module Api
  class Main < ::Sinatra::Base
    register Sinatra::ConfigFile

    register Controllers::General


    configure :development do
      set :host_authorization, { permitted_hosts: [] }
    end

    config_file File.join(File.dirname(__FILE__), '../config/config.yml')
    config_file File.join(File.dirname(__FILE__), '../config/db.yml') 


  end # end module Main
end # end module Api
