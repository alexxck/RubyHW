class Dog < Pet

  RANDOM_PHRASES = [
    ['What the noice? Someone wants to kill us. Whoof whoof, you shall not pass', 'the dog barks loudly'],
    ['i wanna you`r hugs, dude', 'your dog has come to you and wants you hug and pet it'],
    ['ohhh what a nice new shoes', 'the dog is biting your shoes'] 
  ].freeze

  def play
    puts 'you`re throwing the ball and your dog is bringing it'.light_blue
    puts 'whoof whoof it is very funny'.yellow
    super
  end

  def voice
    puts 'wooof, wooof, woof'.yellow
    lower_states
    check
  end

  def love
    puts 'your dog waving his tail and need you pet it'.light_blue
    puts 'whoof whoof, i love you'
    lower_states
    check
  end

  def toilet
    puts 'you`re going outdors together'
    super
  end

  def random
    puts RANDOM_PHRASES.sample.map(&:light_blue)
    lower_states
    check
  end
end