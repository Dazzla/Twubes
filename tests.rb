require 'rubygems'
require 'update'
require 'twitter'

new_tweet = TweetUpdate.new("twubes")
a = new_tweet.send_tweet("twubes", ARGV[0]).inspect

puts a.class