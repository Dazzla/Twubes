#!/usr/bin/ruby

$LOAD_PATH << '~/src/ruby/projects/Twitter/Twubes/'

require 'test/unit'
require 'twitter_auth'
require 'get_rate_limit'

class TestGetRateLimit

  def setup
    @user = "twubes"
    @project = "4978_project"

    @test_session = Session.new(@user, @project)
    @test_auth = @test_session.authenticate
    @get_limit = GetRateLimit.new(@user, @project)
    @get = @get_limit.get

  end

  def test_get_rate_limit

    assert_respond_to(@get_limit, :get)
    assert_respond_to(@get, :reverse)

  end

end
