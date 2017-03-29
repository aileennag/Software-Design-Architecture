
class Employee
    include Comparable
    
   def initialize(name, salary)
       @name = name
       @salary = salary
   end
   
   attr_reader :name, :salary
   attr_writer :name       #-->you can modify de values, in this case the name
   #attr_accessor :name    --> this permits to read and write 
   
   #def name   equals to attr_reader : name
    #  @name
   #end
   
   #def salary equals to attr_reader : salary
    #  @salary
   #end
   
   def to_s
      "I'm an employee, my name is #{@name}, my salary is $#{@salary}" 
   end
   
   def inspect
      to_s
   end
   
   def ==(other)
      @salary == other.salary and @name == other.name
   end
   
   def <=>(other)
      @salary <=> other.salary
   end
    
end

e1 = Employee.new("John", 40_000)
puts e1

e2 = Employee.new("Doris", 100_000)
puts e2

e3 = Employee.new("John", 40_000)
puts e3

puts e1.equal?(e3);

employee_array = [e1, e2, e3]
employee_array.sort!
p employee_array

array = [Employee.new("Jane", 10_000),
         Employee.new("Mary", 20_000),
         Employee.new("Garry", 15_000),
         Employee.new("Damian", 66_666),
         Employee.new("Dana", 25_000)]
         
p array.sort { |x, y| x.name <=> y.name }
p array.sort_by { |x| x.name.length }