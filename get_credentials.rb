#!/usr/bin/env ruby

require 'rubygems'
require 'yaml'

class GetCredentials

  attr_accessor :user, :project
  attr_reader :auth_file, :consumer_key, :consumer_secret, :oauth_token, :oauth_token_secret

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

end
