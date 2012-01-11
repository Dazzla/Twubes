#!/usr/bin/ruby

require 'rubygems'
require 'twitter'
require 'get_credentials'

class   Session

=begin
Provides authentication and session managment methods for API requests
=end

  attr_reader :auth_file
  attr_accessor:user, :project

  def initialize(user, project)

    @user = user.downcase
    @project = project.downcase

    @credentials = GetCredentials.new(@user, @project)

    @consumer_key       =   @credentials.consumer_key
    @consumer_secret    =   @credentials.consumer_secret

    @oauth_token        =   @credentials.oauth_token
    @oauth_token_secret =   @credentials.oauth_token_secret

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