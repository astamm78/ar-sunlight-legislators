require 'twitter'
require 'json'
require_relative '../db/config'
require_relative 'models/politician'

Twitter.configure do |config|
  config.consumer_key = 'eWtK22bsi8vTo1GWFcUlzQ'
  config.consumer_secret = '4e6KpjYsuSK2kB8focVGTpHwhOOj4IqR0piMAW7FI'
  config.oauth_token = '72098167-o4P2Qth9YGacA7T91de7otV0UwQLfJ8IpLwnIp3Tk'
  config.oauth_token_secret = 'iAg81ftpVtgtjhKF2LWXYchb4KqnETPJBpghYbYkGA'
end

politician = Politician.find_by_lastname('Durbin')

Twitter.user_timeline(politician.twitter_id, :count => 10).each do |tw|
  p tw.text
  p tw.id
  p tw.created_at
end
