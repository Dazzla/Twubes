#!/usr/bin/ruby

require 'rubygems'
require 'update'
require 'twitter'
require 'get_rate_limit'


def send_update(user, project, tweet)


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
tweet = ARGV[3]



if mode == "update"
  send_update(user, project, tweet)
  get_rate_limit(user, project)
end

if mode == "getrate"
  get_rate_limit(user, project)
end