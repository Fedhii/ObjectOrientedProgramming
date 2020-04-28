# PHASE 2

def convert_to_int(str)
  begin
    Integer(str)
  rescue ArgumentError
    puts "Oh no, I need the number #{str}, not the number written out!"
  ensure
    num ||= 0
  end

  num
end

class CoffeeError < StandardError
  def message
    "I can't have any more caffeine. My poor heart couldn't take it. You can try again."
  end
end

class NotAFruitError < StandardError
  def message
    "That doesn't look like a fruit. You tricked me. * runs away *"
  end
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == "coffee" 
    raise CoffeeError
  else
    raise NotAFruitError
  end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  begin 
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit) 
  rescue CoffeeError => e
    puts e.message
    retry
  rescue NotAFruitError => e
    puts e.message
  end

end  



# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    raise ArgumentError.new("Girl you know we ain't best friends if we've only known each other for #{yrs_known} years") if yrs_known.to_i < 5
    raise ArgumentError.new("Bruh if we're friends you need to tell me your name at least??") if name.length <= 1
    raise ArgumentError.new("Look mayne, real friends know what their friends like to do in their free time. So tell me, what do you like to do?") if fav_pastime.length <= 1
      
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


