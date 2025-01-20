require 'sequel'

# Set the environment
environment = ENV.fetch('RACK_ENV', 'development')

# Configure the database connection.
db_initializer = File.expand_path('./database_initializer.rb', __dir__)

# Connect to the database.
require db_initializer

Sequel.extension :migration

migration_directory = File.join(File.dirname(__FILE__), 'migrations')



begin
  Sequel::Migrator.run(DB, migration_directory)
rescue Exception => e
  puts("There was an exception running the migrations: #{e.message}")
ensure
  DB.disconnect if defined?(DB)
end
