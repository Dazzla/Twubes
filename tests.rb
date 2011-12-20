#!/usr/bin/ruby

require 'rubygems'
require 'update'
require 'twitter'
require 'get_rate_limit'

def send_update(user, tweet, project)
  new_tweet = TweetUpdate.new(user, project)
  new_tweet.send_tweet(user, tweet)
end

def get_rate_limit(user, project)
  limit = GetRateLimit.new(user, project)
  limit.get()
end

user    = ARGV[0]
message = ARGV[1]
project = ARGV[2]
mode = ARGV[3]

if mode == "update"
  send_update(user, message, project)
end

get_rate_limit(user, project)
