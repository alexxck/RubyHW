class Pet 
  attr_accessor :name

  def initialize(name)
    @name = name
    @feed_level = 3
    @water_level = 3
    @energy_level = 3
    @lifes = 3
    @mood = 'happy'
    @need_toilet = false
  end

  def feed
    if @feed_level < 3
      @feed_level = 3
      puts 'omnomnom. thank u, dude'.yellow
      @mood = 'happy'
    else
      puts 'feeeeeee. not hungry.'.pink
    end
    check
  end
  
  def water
    if @water_level < 3
      @water_level = 3
      puts 'bul-bul-hlyup-hlyup. thank u, dude'.yellow
      @mood = 'happy'
    else
      puts 'feeeeeee. not thirsty.'.pink
    end
    check
  end

  def go_sleep
    if @energy_level < 3
      @energy_level = 3
      puts 'hhhhrrrrrptcchhhhhh'.yellow
    else
      puts 'feeeeeee. don`t wanna sleep'.pink
    end
    check
    lower_states
    @mood = 'good'
  end

  def toilet
    if @need_toilet
      puts 'I`ve done it'.yellow
    else
      puts 'feeeeeee. don`t need toilet'.pink
    end
    @need_toilet = false
    lower_states
    check
  end

  def play
    p 'you`r playing with your pet'
    lower_states
    check
    @mood = 'happy'
  end

  def is_dead?
    @lifes == 0
  end

  private

  def hungry?
    @feed_level == 1
  end

  def thirsty?
    @water_level == 1
  end

  def sleepy?
    @energy_level == 1
  end

  def lower_states
    @feed_level -= 1
    @water_level -= 1
    @energy_level -= 1
  end

  def maybe_lose_life    
    if [@feed_level, @water_level, @energy_level].any?(&:zero?)
      @lifes -=1 
      puts "I have just lost one of my lifes(( now I have #{@lifes} lifes".red
      @feed_level = 3
      @water_level = 3
      @energy_level = 3
    end
  end

  def check
    puts('I`m so  hungry!'.red) if hungry?
    puts('I`m so thirsty!'.red) if thirsty?
    puts('I need toilet!'.red) if @need_toilet
    puts('I need to sleep!'.red) if sleepy?
    maybe_lose_life  
  end  
end