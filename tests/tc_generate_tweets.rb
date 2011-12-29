#!/usr/bin/ruby

$LOAD_PATH << '~/src/ruby/projects/Twitter/Twubes/'

require 'test/unit'
require 'generate_tweets'

class TestGenerateTweets < Test::Unit::TestCase


  def setup

    @new_message_fetcher = GenerateTweets.new

  end


  def test_valid_tweet

    assert_respond_to(@new_message_fetcher, :valid_tweet)
    @valid_tweet = @new_message_fetcher.valid_tweet
    assert_respond_to(@valid_tweet, :reverse)

  end


  def test_tweet_on_boundary

    assert_respond_to(@new_message_fetcher, :tweet_on_boundary)
    @tweet_on_boundary = @new_message_fetcher.tweet_on_boundary
    assert_equal(140, @tweet_on_boundary.length)

  end


  def test_tweet_over_boundary

    assert_respond_to(@new_message_fetcher, :tweet_over_boundary)
    @tweet_over_boundary = @new_message_fetcher.tweet_over_boundary
    assert_equal(141, @tweet_over_boundary.length)

  end


end
