require 'rspec'
require 'dotenv'
Dotenv.load

Dir["./lib/*.rb"].each { |file| require file }
