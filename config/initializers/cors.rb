# config/initializers/cors.rb

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'localhost:8080', '127.0.0.1:8080'

    resource '*', headers: :any, methods: [:get, :post, :patch, :put]
  end
end
