#!/usr/bin/ruby

class   Session

=begin
Provides authentication and session managment methods for API requests
=end

  require 'rubygems'
  require 'twitter'

  attr_accessor :auth_file

  def initialize(user, project)


    @user = user.downcase
    @project = project.downcase

    @conf_file_path = "./auth/"
    @conf_file = "twitter_keys.yaml"

    @auth_file         =   @conf_file_path+@conf_file

    @keys = YAML.load_file(@auth_file)

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