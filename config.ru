require 'rubygems'
require 'bundler'
Bundler.require
Dotenv.load
require './app'

use Rack::Static, urls: ['/bootstrap'], root: 'public'

# Change your session key
@secret ||= SecureRandom.hex(32)
use Rack::Session::Cookie, key: '_ruby_on_rack_demo.session', secret: @secret

# Using OmniAuth middleware
use OmniAuth::Builder do
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
end

run RubyOnRackDemo::App.new
