#!/usr/bin/ruby

class GetRateLimit


  require 'rubygems'
  require 'twitter'
  require 'twitter_auth'

  attr_accessor :user, :project


  def initialize(user, project)
    @user = user
    session = Session.new(user, project)
    session.authenticate()
  end

  #returns remaining API requests for given user
  def get()

    rl_remaining = Twitter.rate_limit_status.remaining_hits.to_s + "Twitter API request(s) remaining this hour for #{@user}"
    $stdout.puts rl_remaining

  end

end