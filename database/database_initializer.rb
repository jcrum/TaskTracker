require 'sequel'
require 'yaml'

config_file = File.join(File.dirname(__FILE__), './database.yml')
config = YAML.load_file(config_file, aliases: true)

# Determine the current environment (defaults to development)
environment = ENV['RACK_ENV'] || 'development'

# Get the database URL for the current environment
database_url = config[environment]['database_url']

# Connect to the database
DB = Sequel.connect(database_url)
