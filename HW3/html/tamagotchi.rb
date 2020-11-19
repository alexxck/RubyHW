#require_relative "gem"
require 'alex_gem'

class Pet

  include Log

  def initialize(name)
    @name = name
    @pet_type = pet_type
    @asleep = false
    @appetite = 10  #  Он сыт.
    @want_play = 0  #  Ему не надо гулять.
    @hp = 100 # уровень здоровья
    @content = nil
    @emoji = "&#x1F609;"
  end

  attr_accessor :name, :pet_type, :appetite, :want_play, :hp, :content

  def feed
    puts "Вы кормите #{@name}."
    @appetite = 10
    @emoji = "&#x1F354;"
    p_time
  end

  def walk
    puts "Вы гуляете с питомцем #{@name} он веселится."
    @want_play -=1
    @emoji = "&#x1F973;"
    p_time
  end

  def sleepy
    puts "Вы ложите спать #{@name} ZzzZZzzZZz.."
    @emoji = "&#x1F634;"
    @asleep = true
    5.times do
      if @asleep
        p_time
      end

      if @asleep
        p_time
        puts @name + ' Хропит!! Хрр Хрр хррРр'
      end

    end

    if @asleep
      @asleep = false
      puts "питомец #{@name} медленно просыпается"
    end
  end

  def play
    @emoji = "&#x1F61C;"
    puts "Вы щекочете и затем подбрасывете #{@name} в воздух"
    puts 'Он хихикает и облизывает ваше лицо'
    p_time
  end

  def wash
    puts "вы моете #{@name} в тазике теплой воды"
    @asleep = true
    @emoji = "&#x1F6BF;"
    puts 'питомец начинает дремать...'
    p_time
    if @asleep
      @asleep = false
      puts '...но просыпается как только хотели положить его в кровать'
    end
  end

  def heal
        puts "ваш любимец #{@name} имеет больной вид"
        @hp += 30
        @emoji = "&#x1F912;"
      p_time
  end

  private

  #  "private" означает, что определённые здесь методы являются
  #  внутренними методами этого объекта.  (Вы можете кормить
  #  вашего Peta, но не можете спросить его, голоден ли он.)
  def stat

      @str = "имя: #{@name}, сытость: #{@appetite}, хочет гулять: #{@want_play}, hp: #{@hp} #{@emoji} "
      puts @str
      to_html(content)
    # (@content)
  end

  def hungry?  #  голоден?
    #  Имена методов могут заканчиваться знаком "?".
    #  Как правило, мы называем так только, если метод
    #  возвращает true или false, как здесь:
    @appetite <= 2
  end

  def disease?  #  болен?
    @hp <= 50
  end

  def poopy?  #  кишечник полон?
    @want_play >= 8
  end

  def p_time # проходит некоторое время

    if @appetite > 0
      #  Переместить пищу из желудка в кишечник.
      @appetite -= 1
      @want_play +=2
      @hp -= 3

    else  #  питомец страдает от голода!

      if @asleep
        @asleep = false
        puts 'Он внезапно просыпается!'
      end

      puts @name + ' очень проголодался! Начинает грызть вашу ногу, бросается и поедает Вас!'
      @emoji = "&#x2620;"
      exit  #  Этим методом выходим из программы.
    end

    if @want_play >= 10
      @want_play = 0
      puts "Фууу!! #{@name} сделал какашку"
      @hp += 2

    end

    if hungry?
      if @asleep
        @asleep = false
        puts " #{@name} он внезапно просыпается!!"
      end

      puts "Урчит в желудке #{@name}"
      if @asleep
        @asleep = false
        puts " он внезапно просыпается!"
      end

      puts " #{@name} смешно топчется и хочет на горшок.."

    end

      puts "=          TAMAGOTCHI          ="
      puts "=            _     _           ="
      puts "=           | |   | |          ="
      puts "=           | |___| |          ="
      puts "=          /  _____  \\         ="
      puts "=         |  /_   _\\ |         ="
      puts "=         | |(O) (O)| |        ="
      puts "=         | |-  ^  -| |        ="
      puts "=         \\ \\_______//       ="
      puts "=         \\___NNN___/          ="
      puts "=          /       \\           ="
      puts "=          \\/|~~~|\\/           ="
      puts "=            |     |           ="
      puts "=            |  |  |           ="
      puts "=            \\_| _/            ="
      puts "=                              ="


      stat  #write string in file


  end

end
puts 'Он родился!! =) дайте ему имя: '
pet = Pet.new @name = gets.chomp.capitalize

@pet_type = %w(кролик щенок птичка дракончик котёнок змея).sample

while true do

  puts "миленький #{@pet_type} по имени #{@name} хочет с тобой дружить"
  puts "feed - кормить, walk - гулять, sleep - ложить спать"
  puts "play - играть,  wash - мыть,   heal - лечить"
  print "Ведите команду: "

  command = gets.chomp
  if command == "feed"
    pet.feed
  elsif command == "walk"
    pet.walk
  elsif command == "sleep"
    pet.sleepy
  elsif command == "play"
    pet.play
  elsif command == "wash"
    pet.wash
  elsif command == "heal"
    pet.heal
  end

sleep 5 #цикл прирывается на N сек
system ("clear")
end
