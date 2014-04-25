require 'rubygems'
require 'bundler'
Bundler.require
Dotenv.load
require './app'

use Rack::Static, urls: ['/bootstrap'], root: 'public'

# Change your session key
@secret ||= SecureRandom.hex(32)
use Rack::Session::Cookie, key: '_ruby_on_rack_demo_app.session', secret: @secret

# Using OmniAuth middleware
use OmniAuth::Builder do
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
end

puts "the github key is #{ENV['GITHUB_KEY']}"
puts "the github secret is #{ENV['GITHUB_SECRET']}"

run RubyOnRackDemo::App.new
