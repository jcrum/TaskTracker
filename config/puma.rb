require 'semantic_logger'

SemanticLogger.default_level = :trace
SemanticLogger.add_appender(file_name: 'logs/app.log', formatter: :color)

def puma_log
  SemanticLogger['puma']
end

def disconnect_database(message)
  return unless defined?(DB)

  puma_log.info message
  DB.disconnect if defined?(DB)
end

# Specifies the `threads` directive to configure the minimum and maximum threads Puma will use.
threads_count = ENV.fetch('PUMA_THREADS') { 5 }.to_i
threads threads_count, threads_count

# Specifies the `port` Puma will listen on.
port ENV.fetch('PORT') { 9292 }

# Specifies the `environment` Puma will run in.
environment ENV.fetch('RACK_ENV') { 'development' }

# Specifies the `workers` directive for the number of worker processes.
workers ENV.fetch('WEB_CONCURRENCY') { 2 }.to_i

# Load the database configuration.
environment ENV.fetch('RACK_ENV', 'development')
db_initializer = File.expand_path('../database/database_initializer.rb', __dir__)

# Preload the application for clustered mode.
# preload_app!

on_worker_fork do
  SemanticLogger.repoen
  disconnect_database('on_worker_fork: Disconnecting database connection before forking.')
end

on_worker_boot do
  SemanticLogger.reopen
  puma_log.info 'on_worker_boot: Connecting database connection after forking.'
  require db_initializer
  puma_log.info 'on_worker_boot: Database Initiazed.'
end

at_exit do
  disconnect_database('at_ext: Disconnecting the database connection.')
end

log_requests true
