def disconnect_database(message)
  if defined?(DB)
    puts message 
    DB.disconnect if defined?(DB)
  end

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
preload_app!

on_worker_fork do
  disconnect_database('BEFORE FORK: Disconnecting database connection before forking.')
end

on_worker_boot do
  puts 'AFTER FORK: Connecting database connection after forking.'
  require db_initializer
end

at_exit do
  disconnect_database('ON EXIT: Disconnecting the database connection.')
end
