#==========================================================
# Aileen N. Ayala García    A01166738
#==========================================================

require 'minitest/autorun'
require 'observer'

#==========================================================
# Code for Question 1

class Student

  attr_reader :id, :name, :gender, :gpa

  def initialize(id, name, gender, gpa)
    @id = id
    @name = name
    @gender = gender
    @gpa = gpa
  end

end

STUDENT_LIST = [Student.new(115, 'John', :male, 3.4),
                Student.new(841, 'Mary', :female, 2.6),
                Student.new(642, 'Matthew', :male, 4.0),
                Student.new(884, 'Mark', :male, 1.8),
                Student.new(536, 'Luke', :male, 2.6),
                Student.new(716, 'Magdalene', :female, 3.8),
                Student.new(780, 'Sapphira', :female, 2.1)]

class StudentStrategy

  def execute(array)
    raise 'Abstract method called!'
  end

end

class Course

  def strategy=(new_strategy)
    if !new_strategy.is_a? StudentStrategy
      raise 'Invalid argument'
    end
    @strategy = new_strategy
  end

  def initialize
    @students = []
    @strategy = nil
  end

  def add_student(student)
    @students.push(student)
  end

  def execute
    @strategy.execute(@students)
  end

end

#----------------------------------------------------------
# Place here your code for these classes:
class CountGenderStrategy < StudentStrategy
  def initialize(gender)
    @count = 0.0
    @gen = gender
  end
  
  def execute(array)
    if (array.empty?)
      return 0
    else
      array.each do |student|
        if student.gender == @gen
          @count += 1
        end
      end
      return @count
    end
  end

end

class ComputeAverageGPAStrategy < StudentStrategy
  def initialize()
    @average = 0.0
  end
  
  def execute(array)
    if (array.empty?)
      return nil
    else
      array.each do |student|
        @average += student.gpa
      end
      return @average/array.length
    end
  end
  
end

class BestGPAStrategy < StudentStrategy
  def initialize()
    @maxGPA = 0.0
    @student_name = nil
  end
  
  def execute(array)
    if (array.empty?)
      return nil
    else
      array.each do |student|
        if (@maxGPA < student.gpa)
          @maxGPA = student.gpa
          @student_name = student.name
        end
      end
    end
    return @student_name
  end
  
end
#----------------------------------------------------------

class ExamTest1 < Minitest::Test

  def setup
    @a = Course.new
    @b = Course.new
    STUDENT_LIST.each {|student| @b.add_student(student) }
  end

  def test_1
    @a.strategy = CountGenderStrategy.new(:female)
    @b.strategy = CountGenderStrategy.new(:female)
    assert_equal(0, @a.execute)
    assert_equal(3, @b.execute)
    @a.strategy = CountGenderStrategy.new(:male)
    @b.strategy = CountGenderStrategy.new(:male)
    assert_equal(0, @a.execute)
    assert_equal(4, @b.execute)
  end

  def test_2
    @a.strategy = ComputeAverageGPAStrategy.new
    @b.strategy = ComputeAverageGPAStrategy.new
    assert_nil(@a.execute)
    assert_equal(2.9, @b.execute)
  end

  def test_3
    @a.strategy = BestGPAStrategy.new
    @b.strategy = BestGPAStrategy.new
    assert_nil(@a.execute)
    assert_equal('Matthew', @b.execute)
  end

end

#==========================================================
# Code for Question 2
#----------------------------------------------------------
# Place here your code for these classes: 

class Notifier
  include Observable
  
  def event(value)
    @value = value
    
    changed
    notify_observers(value)
  end
  
end

class Listener
  include Observable

  def initialize
    @values = []
  end
  
  def update(value)
    @values << value
  end
  
  def events_received()
     return @values.join(" ")
  end
  
end
#----------------------------------------------------------

class ExamTest2 < Minitest::Test

  def test_1
    x = Notifier.new
    a = Listener.new
    b = Listener.new
    c = Listener.new
    d = Listener.new
    x.event('Hello')
    x.add_observer(a)
    x.add_observer(b)
    x.add_observer(c)
    x.event('Hola')
    x.delete_observer(a)
    x.delete_observer(b)
    x.add_observer(d)
    x.event('Bonjour')
    x.add_observer(b)
    x.event('Kaixo')
    assert_equal('Hola', a.events_received)
    assert_equal('Hola Kaixo', b.events_received)
    assert_equal('Hola Bonjour Kaixo', c.events_received)
    assert_equal('Bonjour Kaixo', d.events_received)
  end

end