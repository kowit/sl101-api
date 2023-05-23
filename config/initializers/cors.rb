# config/initializers/cors.rb

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "localhost:9091", "127.0.0.1:9091", "https://studentlife-nu.vercel.app"

    resource "*", headers: :any, methods: %i[get post patch put]
  end
end
