require_relative 'string_beauty'
require_relative 'pet'
require_relative 'dog'
require_relative 'cat'

class Ui
  COMMANDS = %w[feed play water toilet sleep status voice love observe exit].freeze
  def start
    init_pet
    
    while true      
      if @pet.is_dead? 
        puts "i`m dying. i loved u. sorry. ".red
        break
      end   

      command = enter_command
      case command
      when 'feed'
        @pet.feed
      when 'water'
        @pet.water
      when 'toilet'
        @pet.toilet
      when 'sleep'
        @pet.go_sleep
      when 'play'
        @pet.play
      when 'status'
        p @pet
      when 'voice'
        @pet.voice
      when 'love'
        @pet.love
      when 'observe'
        @pet.random
      when 'exit'
        break
      else
        p "sorry, i don't know this command: #{command}"
      end 
    end
  end
  
  def init_pet
    puts 'Please, enter you`r pet`s name? '.yellow
    name = gets.chomp
    puts 'Choose cat or dog, please'.yellow
    type = gets.chomp.downcase
    if type == 'dog'
      @pet = Dog.new(name)
    elsif type == 'cat'
      @pet = Cat.new(name)
    else
      puts 'Don`t know this pet'
    end
    puts "Hi i'm your #{@pet.class}. My name is #{@pet.name}. And I love u :*".yellow
  end

  def enter_command
    puts 'choose a command, please: '.green
    puts COMMANDS.join(', ')    
    command = gets.strip.downcase
  end
end

Ui.new.start