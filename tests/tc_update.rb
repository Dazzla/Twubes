#!/usr/bin/ruby

$LOAD_PATH << '~/src/ruby/projects/Twitter/Twubes/'

require 'rubygems'
require 'twitter'
require 'twitter_auth'
require 'update'
require 'test/unit'

class TestUpdate < Test::Unit::TestCase

  def setup

    @user = "twubes"
    @project = "4978_project"

    @update = TweetUpdate.new(@user, @project)

  end

  def test_instantiation

    assert_respond_to(@update, :send_tweet)

  end

end
