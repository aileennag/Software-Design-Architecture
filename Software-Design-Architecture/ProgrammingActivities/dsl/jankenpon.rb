# Domain-Specific Language Pattern
# Date: 22-Mar-2017
# Authors:
#          A01166738     Aileen N. Ayala   
#          A01372276     Eduardo Castilla

# File: jankenpon.rb

require 'singleton'

class Jankenpon
  include Singleton
  def self.+(value)
    if self == value
      puts "#{self} tie (winner #{self})"
      return self
    elsif (self == Scissors && value == Paper) || (self == Paper && value == Scissors)
      puts "Scissors cut Paper (winner Scissors)"
      return Scissors
    elsif (self == Paper && value == Rock) || (self == Rock && value == Paper)
      puts "Paper covers Rock (winner Paper)"
      return Paper
    elsif (self == Rock && value == Lizard) || (self == Lizard && value == Rock)
      puts "Rock crushes Lizard (winner Rock)"
      return Rock
    elsif (self == Lizard && value == Spock) || (self == Spock && value == Lizard)
      puts "Lizard poisons Spock (winner Lizard)"
      return Lizard
    elsif (self == Spock && value == Scissors) || (self == Scissors && value == Spock)
      puts "Spock smashes Scissors (winner Spock)"
      return Spock
    elsif (self == Scissors && value == Lizard) || (self == Lizard && value == Scissors)
      puts "Scissors decapitate Lizard (winner Scissors)"
      return Scissors
    elsif (self == Lizard && value == Paper) || (self == Paper && value == Lizard)
      puts "Lizard eats Paper (winner Lizard)"
      return Lizard
    elsif (self == Paper && value == Spock) || (self == Spock && value == Paper)
      puts "Paper disproves Spock (winner Paper)"
      return Paper
    elsif (self == Spock && value == Rock) || (self == Rock && value == Spock)
      puts "Spock vaporizes Rock (winner Spock)"
      return Spock
    elsif (self == Rock && value == Scissors) || (self == Scissors && value == Rock)
      puts "Rock crushes Scissors (winner Rock)"
      return Rock
    end
  end
  
  def self.-(value)
    if self == value
      puts "#{self} tie (winner #{self})"
      return self
    elsif (self == Scissors && value == Paper) || (self == Paper && value == Scissors)
      puts "Scissors cut Paper (loser Paper)"
      return Paper
    elsif (self == Paper && value == Rock) || (self == Rock && value == Paper)
      puts "Paper covers Rock (loser Rock)"
      return Rock
    elsif (self == Rock && value == Lizard)  || (self == Lizard && value == Rock)
      puts "Rock crushes Lizard (loser Lizard)"
      return Lizard
    elsif (self == Lizard && value == Spock) || (self == Spock && value == Lizard)
      puts "Lizard poisons Spock (loser Spock)"
      return Spock
    elsif (self == Spock && value == Scissors) || (self == Scissors && value == Spock)
      puts "Spock smashes Scissors (loser Scissors)"
      return Scissors
    elsif (self == Scissors && value == Lizard) || (self == Lizard && value == Scissors)
      puts "Scissors decapitate Lizard (loser Lizard)"
      return Lizard
    elsif (self == Lizard && value == Paper) || (self == Paper && value == Lizard)
      puts "Lizard eats Paper (loser Paper)"
      return Paper
    elsif (self == Paper && value == Spock) || (self == Spock && value == Paper)
      puts "Paper disproves Spock (loser Spock)"
      return Spock
    elsif (self == Spock && value == Rock) || (self == Rock && value == Spock)
      puts "Spock vaporizes Rock (loser Rock)"
      return Rock
    elsif (self == Rock && value == Scissors) || (self == Scissors && value == Rock)
      puts "Rock crushes Scissors (loser Scissors)"
      return Scissors
    end
  end

end


class Rock < Jankenpon
end

class Paper < Jankenpon
end

class Scissors < Jankenpon
end

class Lizard < Jankenpon
end

class Spock < Jankenpon
end


def show(expression)
  puts "Result = #{expression}"
end