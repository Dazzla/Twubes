#!/usr/bin/ruby

require 'rubygems'
require 'twitter'
require 'twitter_auth'

def get_rate_limit(user)
  
  user = user.to_s
  session = Session.new(user)

  session.authenticate()

  rl_remaining = Twitter.rate_limit_status.remaining_hits.to_s + " Twitter API request(s) remaining this hour for #{user}"

  $stdout.puts rl_remaining

end

get_rate_limit(ARGV[0])