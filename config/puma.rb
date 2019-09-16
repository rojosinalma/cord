env               = ENV.fetch("BOT_ENV", "development")
max_threads_count = ENV.fetch("PUMA_MAX_THREADS", 5)
min_threads_count = ENV.fetch("PUMA_MIN_THREADS", max_threads_count)

environment     env
threads         min_threads_count, max_threads_count
port            ENV.fetch("PORT", 3000)
rackup          'config.ru'
pidfile         ENV.fetch("PUMA_PIDFILE", 'tmp/pids/puma.pid')
state_path      ENV.fetch("PUMA_STATE",   'tmp/pids/puma.state')
stdout_redirect('logs/puma_access.log',   'logs/puma_error.log', true) if env == "production"
