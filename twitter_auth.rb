#!/usr/bin/ruby

class   Session

  def authenticate(user, consumer_key, oauth_token, token_secret, consumer_secret)
    require 'rubygems'
    require 'twitter'


    Twitter.configure do |config|
      config.consumer_key = consumer_key
      config.oauth_token = oauth_token 
      config.oauth_token_secret = token_secret
      config.consumer_secret = consumer_secret
    end

  end

end