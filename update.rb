#!/usr/bin/ruby


require 'rubygems'
require 'twitter'
require 'twitter_auth'

TOTAL_TWEET_LENGTH = 140

def send_tweet(user, tweet)


  session = Session.new

  session.authenticate(user)

  overtweet = (tweet.length - 140)

  if overtweet < 1
    Twitter.update(tweet)
  else
    $stdout.puts "Tweet too long by #{overtweet} char(s) (tweet length = #{tweet.length} chars)"
  end

end

user = ARGV[0].downcase
tweet = ARGV[1]

send_tweet(user, tweet)