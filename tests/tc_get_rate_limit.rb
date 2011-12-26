#!/usr/bin/ruby

$LOAD_PATH << '~/src/ruby/projects/Twitter/Twubes/'

require 'test/unit'
require 'twitter_auth'
require 'get_rate_limit'

class TestGetRateLimit < Test::Unit::TestCase

  def setup

    @user = "twubes"
    @project = "4978_project"
    @conf_file_path = "../auth/"

    @get_limit = GetRateLimit.new(@user, @project)

  end


  def test_params

    assert_equal(@user, GetRateLimit.new(@user, @project).user)
    assert_equal(@project, GetRateLimit.new(@user, @project).project)

  end


  def test_get_rate_limit

    @limit_message = @get_limit.get

    assert_respond_to(@get_limit, :get)
    assert_respond_to(@limit_message, :reverse)

  end

end