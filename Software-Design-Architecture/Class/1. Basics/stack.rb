
class Stack
  
  include Enumerable
  
   def initialize
      @data = [] 
   end
   
   def empty?
      @data.empty? 
   end
   
   def push(x)
      @data << x 
   end
   
   def pop(x)
    if empty?
       nil
    else
       @data.pop
    end
   end
   
   def peek
     @data.last
   end
   
   def to_s
     @data.to_s
   end
   
   def each(&p)
     @data.each(&p)
   end
   
end

s = Stack.new
s.push(4)
s.push(8)
s.push(15)
s.push(16)

puts s

puts s.peek
puts s
puts '.............'
s.each{ |x| puts x }
p s.map{ |x| x**2 }
puts s.reduce{ |x, y| x + y}
