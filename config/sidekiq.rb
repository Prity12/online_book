if Rails.env == "development"
  Sidekiq.configure_server do |config|
    config.redis = {url: 'redis://localhost:6379/0'}
  end

  Sidekiq.configure_client do |config|
    config.redis = {url: 'redis://localhost:6379/0'}
  end
else
  Sidekiq.configure_server do |config|
    config.redis = {url: 'redis://redis-master.redis.svc.cluster.local:6379/0'}
  end

  Sidekiq.configure_client do |config|
    config.redis = {url: 'redis://redis-master.redis.svc.cluster.local:6379/0'}
  end
end
