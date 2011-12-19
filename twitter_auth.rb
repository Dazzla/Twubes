#!/usr/bin/ruby

class   Session

=begin
Provides authentication and session managment methods for API requests
=end

  require 'rubygems'
  require 'twitter'

  CONF_FILE_PATH      =   "./auth/"
  @@auth_file         =   CONF_FILE_PATH+"twitter_keys.yaml"

  
  def initialize(user, project)

    puts user
    puts project
    
    @keys = YAML.load_file(@@auth_file)

    @consumer_key       =   @keys["project"][project]["consumer_key"]
    @consumer_secret    =   @keys["project"][project]["consumer_secret"]
    
    @oauth_token        =   @keys["user"][user]["access_token"]
    @oauth_token_secret =   @keys["user"][user]["token_secret"]

    puts
    puts @consumer_key
    puts @consumer_secret
    puts @oauth_token
    puts @oauth_token_secret
    puts


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