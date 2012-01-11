#!/usr/bin/env ruby

require 'rubygems'
require 'get_credentials'
require 'oauth'
require 'launchy'

class OauthTwitter

  def initialize(user, project)

    puts user
    puts project

    @user = user.downcase
    @project = project.downcase

    @credentials = GetCredentials.new(@user, @project)

    @consumer_key       =   @credentials.consumer_key
    @consumer_secret    =   @credentials.consumer_secret

    @oauth_token        =   @credentials.oauth_token
    @oauth_token_secret =   @credentials.oauth_token_secret

    consumer = OAuth::Consumer.new(@consumer_key, @consumer_secret,
    :site => "https://api.twitter.com" )

    request_token = consumer.get_request_token

    # open browser for authorization
    Launchy.open request_token.authorize_url

    puts "Please authorize the app to have access to your Twitter account. A pincode will be displayed to you, please enter it here:"

    pincode = gets.chomp

    access_token = request_token.get_access_token :pin => pincode

    access_token.token # user token
    access_token.secret # user oauth secret

  end


end

au = OauthTwitter.new("twubes", "twubes_project")