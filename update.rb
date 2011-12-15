#!/usr/bin/ruby


require 'rubygems'
require 'twitter'
require 'twitter_auth'

def sendtweet(user, tweet)

  session = Authenticate.new

  session.login(user)

  message = tweet

  overtweet = (message.length - 140)

  if overtweet < 1
    Twitter.update(message)
  else
    $stdout.puts "Message too long by #{overtweet} char(s) (message length = #{message.length} chars)"
  end

end

sendtweet(ARGV[0], ARGV[1])