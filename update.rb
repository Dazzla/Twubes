#!/usr/bin/ruby

class TweetUpdate
  
require 'rubygems'
require 'twitter'
require 'twitter_auth'

  TWEET_LENGTH_LIMIT = 140

  def initialize(user)
    
    @session = Session.new(user)
    @session.authenticate()
    
  end

  #Collect user name, call authentication and send tweet.
  def send_tweet(user, tweet)
  
    #Prevent duplicate tweets from sending.
    last_tweet = Twitter.user_timeline(user).first.text
  
    #Catch over-length tweets before they're sent to Twitter.
    overtweet = (tweet.length - TWEET_LENGTH_LIMIT)
    
    if overtweet > 0
      $stdout.puts "Tweet too long by #{overtweet} char(s) (tweet length = #{tweet.length} chars)"
    elsif tweet == last_tweet
      $stdout.puts "Duplicate of previous tweet (#{last_tweet}). Not sent."
    else
      response = Twitter.update(tweet)
      #File.open("tweet_status", "w") {|file| file << status}
   end

  end

end
#Test from command-line
#user = ARGV[0].downcase
#tweet = ARGV[1]

#send_tweet(user, tweet)