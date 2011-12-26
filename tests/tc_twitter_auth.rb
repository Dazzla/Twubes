#!/usr/bin/ruby

$LOAD_PATH << '~/src/ruby/projects/Twitter/Twubes/'

require 'test/unit'
require 'twitter_auth'


class TestSession < Test::Unit::TestCase

  def setup

    @test_session = Session.new("twubes", "4978_project")
    @test_auth = @test_session.authenticate

    @auth_file         =   '/Users/Dazzla/Dropbox/src/ruby/projects/Twitter/Twubes/auth/twitter_keys.yaml'

    @keys = YAML.load_file(@auth_file)

    @consumer_key       =   @keys["project"]["4978_project"]["consumer_key"]
    @consumer_secret    =   @keys["project"]["4978_project"]["consumer_secret"]

    @oauth_token        =   @keys["user"]["twubes"]["access_token"]
    @oauth_token_secret =   @keys["user"]["twubes"]["token_secret"]

  end


  def test_basic_instantiation

    assert_respond_to(@test_session, :authenticate)
    assert_equal("twubes", @test_session.user)
    assert_equal("4978_project", @test_session.project)

  end


  def test_authentication

    assert_respond_to(@test_auth, :oauth_token)
    assert_equal(@consumer_key,       @test_auth.consumer_key)
    assert_equal(@consumer_secret,    @test_auth.consumer_secret)
    assert_equal(@oauth_token,         @test_auth.oauth_token)
    assert_equal(@oauth_token_secret,  @test_auth.oauth_token_secret)

  end

end