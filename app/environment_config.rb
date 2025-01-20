require 'sinatra/config_file'

module EnvironmentConfig
  
  def self.registered(app)
    app.register Sinatra::ConfigFile

    app.config_file File.join(File.dirname(__FILE__), '../config/config.yml')
    app.config_file File.join(File.dirname(__FILE__), '../database/database.yml')
  end 

end # module EnvironmentConfig
