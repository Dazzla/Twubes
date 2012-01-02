
class GenerateTweets

  #Returns strings to fulfil update test conditions

  def valid_tweet()
  #generates random valid tweet
    letters = { ?v => 'AEIOU',
                ?c => 'BCDFGHJKLMNPRSTVWYZ' }
    word = ''
    'cvcvcv'.each_byte do |x|
      source = letters[x]
      word << source[rand(source.length)].chr
    end

    return word

  end

  def tweet_on_boundary
    #Generates tweet exactly 140 chars long
    ("boundary tweet " + (0...125).map{ ('a'..'z').to_a[rand(26)] }.join)
  end

  def tweet_over_boundary
    #Generates tweet exactly 141 chars long
    ("over length tweet " + (0...123).map{ ('a'..'z').to_a[rand(26)] }.join)
  end

end
