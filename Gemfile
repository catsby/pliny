source "https://rubygems.org"
ruby "2.1.0"

gem "honeybadger"
gem "multi_json"
gem "oj"
gem "pg"
gem "pliny", path: "vendor/pliny"
gem "puma"
gem "sequel"
gem "sequel_pg", require: "sequel"
gem "sinatra", require: "sinatra/base"
gem "sinatra-contrib", require: ["sinatra/namespace", "sinatra/reloader"]
gem "sinatra-router"

gem 'rack-ssl'

# Secure Headers for headers that are related to security
# https://github.com/twitter/secureheaders
gem 'secure_headers', require: "secure_headers"

group :test do
  gem "rack-test"
  gem "rr", require: false
end
