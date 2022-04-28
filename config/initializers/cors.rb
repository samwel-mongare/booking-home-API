Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "http://localhost:3001"
    resource "*", headers: :any, methods: [:get, :post, :put, :patch, :delete],
    credentials: true
  end
  # this is for production 
  # allow do
  #   origins "production domain"
  #   resource "*", headers: :any, methods: [:get, :post, :put, :patch, :delete],
  #   credentials: true
  # end
end