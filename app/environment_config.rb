# frozen_string_literal: true

require 'sinatra/config_file'

# Provides a means of configuring the application.
# Place all one-off environment configurations into this module
# Place all other configurations into the appropriate file in
#  - config/config.yml
#  - config/environments/ENVIRONMENTNAME.yml
#
# There are also context specific configuration files:
#  - Database -> /database/database.yml
module EnvironmentConfig
  def self.registered(app)
    app.register Sinatra::ConfigFile

    environment = ENV['RACK_ENV'] || 'development'

    app.configure :development do
      app.set :host_authorization, { permitted_hosts: [] }
    end

    ['../config/config.yml',
     '../database/database.yml',
     "../config/environments/#{environment}.yml"].each do |f|
      app.config_file File.join(File.dirname(__FILE__), f)
    end
  end # def self.registered
end # module EnvironmentConfig
