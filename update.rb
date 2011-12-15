#!/usr/bin/ruby


require 'rubygems'
require 'twitter'
require 'twitter_auth'
require 'yaml'

TOTAL_TWEET_LENGTH = 140

def send_tweet(user, tweet)

  keys = YAML.load_file("./auth/twitter_keys.yaml")

  consumer_key = keys[user]["consumer_key"]
  oauth_token = keys[user]["access_token"]

  oauth_token_secret = keys[user]["token_secret"]
  consumer_secret = keys[user]["consumer_secret"]

  session = Session.new

  session.authenticate(user, consumer_key, oauth_token, oauth_token_secret, consumer_secret)

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