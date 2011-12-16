#!/usr/bin/ruby

require 'rubygems'
require 'update'
require 'twitter'
require 'get_rate_limit'

def send_update(user, tweet)
  new_tweet = TweetUpdate.new(user)
  new_tweet.send_tweet(user, tweet)
end

def get_rate_limit(user)
  limit = GetRateLimit.new(user)
  limit.get()
end

user = ARGV[0]
message = ARGV[1]

get_rate_limit(user)
send_update(user, message)