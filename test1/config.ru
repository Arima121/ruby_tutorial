require File.join(File.dirname(__FILE__), 'init')

require File.expand_path('api/v1/endpoints/my_app', File.dirname(__FILE__))

require 'rack/cors'

use Rack::Cors do
  allow do
    origins CONFIG[:rack_origins]
    resource '*', headers: :any, methods: %i[get post put options]
  end
end

run MyApp