#!/usr/bin/ruby


require 'rubygems'
require 'twitter'
require 'twitter_auth'
require 'yaml'

TOTAL_TWEET_LENGTH = 140

#Use Session object to authenticate given account with Twitter.
def authenticate(user)
  keys = YAML.load_file("./auth/twitter_keys.yaml")

  consumer_key = keys[user]["consumer_key"]
  oauth_token = keys[user]["access_token"]

  oauth_token_secret = keys[user]["token_secret"]
  consumer_secret = keys[user]["consumer_secret"]

  session = Session.new

  session.authenticate(user, consumer_key, oauth_token, oauth_token_secret, consumer_secret)
end


#Collect user name, call authentication and send tweet.
def send_tweet(user, tweet)

  authenticate(user)

  #Prevent duplicate tweets from sending.
  lasttweet = Twitter.user_timeline(user).first.text

  #Catch over-length tweets before they're sent to Twitter.
  overtweet = (tweet.length - 140)
  if overtweet > 0
    $stdout.puts "Tweet too long by #{overtweet} char(s) (tweet length = #{tweet.length} chars)"
  elsif tweet == lasttweet
    $stdout.puts "Duplicate of previous tweet. Not sent."
  else
    Twitter.update(tweet)
  end

end

#Test from command-line
user = ARGV[0].downcase
tweet = ARGV[1]

send_tweet(user, tweet)