# Default recommened configuration
# For more detailed confuration setup information / options, see here:
#   https://github.com/twitter/secureheaders
::SecureHeaders::Configuration.configure do |config|
  config.hsts = {:max_age => 99, :include_subdomains => true}
  config.x_frame_options = 'DENY'
  config.x_content_type_options = "nosniff"
  config.x_xss_protection = {:value => 1, :mode => false}
  config.csp = {
    default_src: 'https://*',
    img_src: 'https://*'
  }
end
