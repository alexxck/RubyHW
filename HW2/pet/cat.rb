class Cat < Pet
  RANDOM_PHRASES = [
    ['What the noice? Perhapse mouse. meow. i cauth you', 'you`r cat is running very fast all over the house'],
    ['let it be sleep. murrrrr', 'your cat is falling sleep'],
    ['ohhh what a nice new home sneakers', 'the cat sucked in you`r sneakers'] 
  ].freeze

  def initialize(name)
    super
    @lifes = 9
  end

  def play
    puts 'you`re painting  with a laser on the wall'.light_blue
    puts 'meow , meow , i catch you. i`m a big terrible tiger'.yellow
    super
  end

  def voice
    puts 'meow, meow, mrrrr'.yellow
    lower_states
    check
  end

  def love
    puts 'your cat jump on your hands and need you pet it'.light_blue
    puts 'murrrr murrr, i love you'
    lower_states
    check
  end

  def toilet
    puts 'oh, you need clean the cat`s tray' if @need_toilet 
    super
  end

  def random
    puts RANDOM_PHRASES.sample.map(&:light_blue)
    lower_states
    check
  end
end