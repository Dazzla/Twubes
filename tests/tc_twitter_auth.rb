#!/usr/bin/ruby

$LOAD_PATH << '~/src/ruby/projects/Twitter/Twubes/'

require 'test/unit'
require 'twitter_auth'


class TestSession < Test::Unit::TestCase

  def setup

    @test_session = Session.new("twubes", "4978_project")
    @test_auth = @test_session.authenticate

  end

  def test_basic_instantiation

    assert_respond_to(@test_session, :authenticate)
    assert_equal("./auth/twitter_keys.yaml", @test_session.auth_file)

  end

  def test_authentication

    assert_respond_to(@test_auth, :oauth_token)

  end

end