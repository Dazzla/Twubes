#!/usr/bin/env ruby

$LOAD_PATH << '~/src/ruby/projects/Twitter/Twubes/'

require 'get_credentials'
require 'test/unit'

class TestGetCredentials < Test::Unit::TestCase

  def setup

    @creds = GetCredentials.new("twubes", "4978_project")

    @auth_file         =   '/Users/Dazzla/Dropbox/src/ruby/projects/Twitter/Twubes/auth/twitter_keys.yaml'

    @keys = YAML.load_file(@auth_file)

    @consumer_key       =   @keys["project"]["4978_project"]["consumer_key"]
    @consumer_secret    =   @keys["project"]["4978_project"]["consumer_secret"]

    @oauth_token        =   @keys["user"]["twubes"]["access_token"]
    @oauth_token_secret =   @keys["user"]["twubes"]["token_secret"]

  end

  def test_instantiation

    assert_respond_to(@creds, :methods)
    assert_respond_to(@creds, :user)
    assert_respond_to(@creds, :user=)
    assert_respond_to(@creds, :project)
    assert_respond_to(@creds, :project=)
    assert_respond_to(@creds, :auth_file)
    assert_respond_to(@creds, :consumer_key)
    assert_respond_to(@creds, :consumer_secret)
    assert_respond_to(@creds, :oauth_token)
    assert_respond_to(@creds, :oauth_token_secret)

    assert_equal("twubes", @creds.user)
    assert_equal("4978_project", @creds.project)
    assert_equal("/Users/Dazzla/Dropbox/src/ruby/projects/Twitter/Twubes/auth/twitter_keys.yaml", @creds.auth_file)

  end

  def test_credentials

    assert_equal(@consumer_key,       @creds.consumer_key)
    assert_equal(@consumer_secret,    @creds.consumer_secret)
    assert_equal(@consumer_secret,    @creds.consumer_secret)
    assert_equal(@oauth_token,        @creds.oauth_token)
    assert_equal(@oauth_token_secret, @creds.oauth_token_secret)

  end

end
