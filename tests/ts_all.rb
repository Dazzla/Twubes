#!/usr/bin/ruby

$LOAD_PATH << '~/src/ruby/projects/Twitter/Twubes/'

puts
puts "-------------------------------"
puts "Testing against ruby version:"
puts `rvm current`
puts  Time.new
puts "------------------------------"
puts

require 'tc_twitter_auth'
require 'tc_get_rate_limit'
require 'tc_update'
require 'tc_generate_tweets'
