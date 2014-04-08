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
    # To restrict to certian routes, call the methods explicitly per route
    before do
      set_csp_header
      set_hsts_header
      set_x_frame_options_header
      set_x_xss_protection_header
      set_x_content_type_options_header
    end

    not_found do
      content_type :json
      status 404
      "{}"
    end
  end
end
