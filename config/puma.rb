
# Specifies the `threads` directive to configure the minimum and maximum threads Puma will use.
threads_count = ENV.fetch('PUMA_THREADS') { 5 }.to_i
threads threads_count, threads_count

# Specifies the `port` Puma will listen on.
port ENV.fetch('PORT') { 9292 }

# Specifies the `environment` Puma will run in.
environment ENV.fetch('RACK_ENV') { 'development' }

# Specifies the `workers` directive for the number of worker processes.
workers ENV.fetch('WEB_CONCURRENCY') { 2 }.to_i

# Preload the application for clustered mode.
preload_app!

# Graceful shutdown of workers.
on_worker_boot do
  # Code to run in the worker before booting up (e.g., reconnect to DB).
end
