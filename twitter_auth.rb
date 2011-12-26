#!/usr/bin/ruby

class   Session

=begin
Provides authentication and session managment methods for API requests
=end

  require 'rubygems'
  require 'twitter'

  attr_reader :auth_file
  attr_accessor:user, :project

  def initialize(user, project)

    @user = user.downcase
    @project = project.downcase

    @auth_file         =   '/Users/Dazzla/Dropbox/src/ruby/projects/Twitter/Twubes/auth/twitter_keys.yaml'

    @keys = YAML.load_file(@auth_file)

    @consumer_key       =   @keys["project"][project]["consumer_key"]
    @consumer_secret    =   @keys["project"][project]["consumer_secret"]

    @oauth_token        =   @keys["user"][user]["access_token"]
    @oauth_token_secret =   @keys["user"][user]["token_secret"]

  end


  #Authenticates and initiates session for given user.
  def authenticate()

    Twitter.configure do |config|
      config.consumer_key         =   @consumer_key
      config.oauth_token          =   @oauth_token
      config.oauth_token_secret   =   @oauth_token_secret
      config.consumer_secret      =   @consumer_secret

    end

  end

end