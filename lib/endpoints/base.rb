module Endpoints
  # The base class for all Sinatra-based endpoints. Use sparingly.
  class Base < Sinatra::Base
    include SecureHeaders
    register Pliny::Extensions::Instruments
    register Sinatra::Namespace

    configure :development do
      register Sinatra::Reloader
    end

    # Set secure headers for each endpoint.
    # If you only want this for certain endpoints, include
    # `set_csp_header` in the specific routes
    before do
      set_csp_header
    end

    not_found do
      content_type :json
      status 404
      "{}"
    end
  end
end
