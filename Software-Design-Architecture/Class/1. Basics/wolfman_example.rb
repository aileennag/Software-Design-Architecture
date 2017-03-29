# Using composition to emulate multiple inheritance.

class Man
  
  def initialize(name)
    @name = name
  end
  
  def talk
    "Hello, my name is #{ @name }."
  end
  
end

class Wolf
  
  def howl
    'Hoooooooooooowl!'
  end
  
end

class WolfMan
  
  def initialize(name)
    @man = Man.new(name)
    @wolf = Wolf.new
  end
  
  def talk
    @man.talk + ' And I\'m a wolfman.'
  end
  
  def howl
    @wolf.howl
  end
  
end

def do_something_to_wolf(wolf)
  puts wolf.howl
end

def do_something_to_man(man)
  puts man.talk
end

m = Man.new('Jacob')
puts m.talk

w = Wolf.new
puts w.howl

wm = WolfMan.new('Michael Jackson')
puts wm.talk
puts wm.howl

do_something_to_wolf(w)
do_something_to_wolf(wm)

do_something_to_man(m)
do_something_to_man(wm)
#do_something_to_man(w)