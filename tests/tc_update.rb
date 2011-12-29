#!/usr/bin/ruby

$LOAD_PATH << '~/src/ruby/projects/Twitter/Twubes/'

require 'rubygems'
require 'twitter'
require 'twitter_auth'
require 'update'
require 'test/unit'
require 'generate_tweets'

class TestUpdate < Test::Unit::TestCase

  def setup

    @user = "twubes"
    @project = "4978_project"

    @update = TweetUpdate.new(@user, @project)

  end


  def test_instantiation

    assert_respond_to(@update, :send_tweet)

  end


  def test_send_tweet

    @get_tweet = GenerateTweets.new
    @tweet = @get_tweet.valid_tweet()
    @boundary =

   #send valid tweet

    @test_tweet = @update.send_tweet(@user, @tweet)
    assert_equal(@project, @update.project)
    assert_equal(@user, @update.user)
    assert_equal(@tweet, @update.tweet)

  #boundary tests
    #on boundary
    @boundary = @get_tweet.tweet_on_boundary
    @boundary_test_tweet = @update.send_tweet(@user, @boundary)
    assert_equal(@project, @update.project)
    assert_equal(@user, @update.user)

    #boundary+1
    @max_tweet_length = 140

    @tweet_over_length = @get_tweet.tweet_over_boundary
    @overtweet_test = @update.send_tweet(@user, @tweet_over_length)
    assert_equal("Tweet too long by 1 char(s) (tweet length = 141 chars)", @overtweet_test)

  end

end
