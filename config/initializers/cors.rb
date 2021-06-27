Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    # origins ENV['CROSS_ORIGIN1'], ENV['CROSS_ORIGIN2']
    resource '*', headers: :any, methods: [:get, :post, :patch, :put]
  end
end
