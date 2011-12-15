#!/usr/bin/ruby

class Authenticate

  def login(user)
    require 'rubygems'
    require 'twitter'
    require 'yaml'

    keys = YAML.load_file("./auth/twitter_keys.yaml")

    consumer_key = keys[user]["consumer_key"]
    access_token = keys[user]["access_token"]

    token_secret = keys[user]["token_secret"]
    consumer_secret = keys[user]["consumer_secret"]

    Twitter.configure do |config|
      config.consumer_key = consumer_key
      config.oauth_token = access_token
      config.oauth_token_secret = token_secret
      config.consumer_secret = consumer_secret
    end

  end

end