Sentry.init do |config|
  config.dsn = 'https://a38f2ec91b53327a721ea644b74ba2a5@o4506773990146048.ingest.sentry.io/4506808833474560'
  config.breadcrumbs_logger = [:active_support_logger, :http_logger]

  # Set traces_sample_rate to 1.0 to capture 100%
  # of transactions for performance monitoring.
  # We recommend adjusting this value in production.
  config.traces_sample_rate = 1.0
  # or
  config.traces_sampler = lambda do |context|
    true
  end
end
