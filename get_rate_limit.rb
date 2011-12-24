#!/usr/bin/ruby

class GetRateLimit


  require 'rubygems'
  require 'twitter'
  require 'twitter_auth'

  attr_accessor :user, :project
  attr_writer :conf_file_path


  def initialize(user, project, conf_file_path="./auth/")

    @user = user
    @project = project

    session = Session.new(user, project, conf_file_path)
    session.authenticate()

  end

  #returns remaining API requests for given user
  def get()

    rl_remaining =
      Twitter.rate_limit_status.remaining_hits.to_s + " Twitter API request(s) remaining this hour for #{@user}. using #{project}"
  end

end