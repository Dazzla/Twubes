#!/usr/bin/ruby

class TweetUpdate
  
require 'rubygems'
require 'twitter'
require 'twitter_auth'

  TWEET_LENGTH_LIMIT = 140
  
  #attr_accessor :user, :project
  
  #user = :user
  #project = :project

  def initialize(user, project)
    
    @session = Session.new(user, project)
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
      tweet_text = response.text
      user = response.user["screen_name"]
      puts "Tweet '#{tweet_text}' from user #{user} sent"
      
    end
    
  end

end