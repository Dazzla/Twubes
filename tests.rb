#!/usr/bin/ruby

require 'rubygems'
require 'update'
require 'twitter'
require 'get_rate_limit'


def send_update(user, tweet, project)

  puts user
  puts tweet
  puts project

  new_tweet = TweetUpdate.new(user, project)
  new_tweet.send_tweet(user, tweet)

end

def get_rate_limit(user, project)

  get_limit = GetRateLimit.new(user, project)
  puts get_limit.get()

end

mode = ARGV[0]
user    = ARGV[1]
project = ARGV[2]
message = ARGV[3]



if mode == "update"
  send_update(user, message, project)
  get_rate_limit(user, project)
end

if mode == "getrate"
  get_rate_limit(user, project)
end