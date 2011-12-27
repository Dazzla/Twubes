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


  def random_word()

    letters = { ?v => 'AEIOU',
                ?c => 'BCDFGHJKLMNPRSTVWYZ' }
    word = ''
    'cvcvcv'.each_byte do |x|
      source = letters[x]
      word << source[rand(source.length)].chr
    end
    return word
  end

  def test_instantiation

    assert_respond_to(@update, :send_tweet)

  end

  def test_send_tweet

    @tweet = random_word()

   #send valid tweet

    @test_tweet = @update.send_tweet(@user, @tweet)
    assert_equal(@project, @update.project)
    assert_equal(@user, @update.user)
    assert_equal(@tweet, @update.tweet)

  #boundary tests
    #on boundary
    @boundary = ("boundary tweet " + (0...125).map{ ('a'..'z').to_a[rand(26)] }.join)
    @boundary_test_tweet = @update.send_tweet(@user, @boundary)
    assert_equal(@project, @update.project)
    assert_equal(@user, @update.user)

    #boundary+1
    @max_tweet_length = 140

    @tweet_over_length = ("over length tweet " + (0...123).map{ ('a'..'z').to_a[rand(26)] }.join)
    @overtweet_test = @update.send_tweet(@user, @tweet_over_length)
    assert_equal("Tweet too long by 1 char(s) (tweet length = 141 chars)", @overtweet_test)

  end

end
