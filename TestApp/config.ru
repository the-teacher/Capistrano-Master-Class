# config.ru
require 'rack'

# Define the Rack application
app = Proc.new do |env|
  request = Rack::Request.new(env)

  case request.path
  when '/'
    ['200', {'Content-Type' => 'text/plain'}, ['Hello World']]
  when '/about'
    ['200', {'Content-Type' => 'text/plain'}, ['This is the About page']]
  else
    ['404', {'Content-Type' => 'text/plain'}, ['Page not found']]
  end
end

# Run the application
run app
