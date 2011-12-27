#!/usr/bin/ruby

class GetRateLimit

  require 'rubygems'
  require 'twitter'
  require 'twitter_auth'


  attr_accessor :user, :project, :conf_file_path


  def initialize(user, project)

    @user = user
    @project = project

    session = Session.new(user, project)
    session.authenticate()

  end

  #returns remaining API requests for given user
  def get()

    @limit_update = Twitter.rate_limit_status.reset_time

    rl_remaining =
      Twitter.rate_limit_status.remaining_hits.to_s + " Twitter API request(s) remaining this hour for #{@user}, using #{project}. Last reset at #{@limit_update}"
  end

end