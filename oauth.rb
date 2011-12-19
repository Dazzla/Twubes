#!/usr/bin/ruby

require 'rubygems'
require 'yaml'
require 'twitter'
require 'oauth'




def oauth(project)
  
  @keys = YAML.load_file("./auth/twitter_keys.yaml")
  
  @project = project


  @callback           =   @keys["system"]["callback_url"]
  @consumer_key       =   @keys["project"][@project]["consumer_key"]
  @consumer_secret    =   @keys["project"][@project]["consumer_secret"]
  
  @consumer = OAuth::Consumer.new(@consumer_key, @consumer_secret, :site => "https://agree2")
  @request_token = @consumer.get_request_token(:oauth_callback => @callback_url)
  session[:request_token] = @request_token
  redirect_to @request_token.authorize_url(:oauth_callback => @callback_url)
  
end

oauth("twubes_project")
