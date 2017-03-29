# File: student.rb

class Student

  attr_reader :name, :id
  
  MIN_AVERAGE = 85
  MAX_INCOME = 15_000
  
  def initialize(name:, id:, anual_income:)
    @name = name
    @id = id
    @anual_income = anual_income
    @grades = []
  end

  def reset_anual_income(anual_income)
    previous_anual_income = @anual_income
    @anual_income = anual_income
    previous_anual_income
  end

  def add_grade(grade)
    @grades << grade  #<< append to the end of the array
    self
  end

  def display_personal_info_and_disclaimer
    # Display Personal Information
    puts "Name: #{ @name } ID: #{ @id }"
    puts "Anual income: #{ @anual_income }"
    puts "Grade average: #{ average }"

    display_disclaimer
  end

  def scholarship_worthy?
    # Nothing reasonable to do if this student has currently no grades. 
    raise RuntimeError.new("Can't compute average") if @grades.empty?

    # A student is worthy of a scholarship if he/she has good grades and
    # is poor.
    has_good_grades = average >= MIN_AVERAGE
    is_poor = @anual_income < MAX_INCOME
    has_good_grades and is_poor
  end
  
  private
  
  def display_disclaimer
    # Display Disclaimer
    puts 'The contents of this class must not be considered an offer,'
    puts 'proposal, understanding or agreement unless it is confirmed'
    puts 'in a document signed by at least five blood-sucking lawyers.'
  end
  
  #def average
    #sum = 0
    #@grades.each do |grade|
      #sum += grade
    #end
    #sum / @grades.size.to_f
  #end
  def average
    @grades.reduce(0,:+) / @grades.size.to_f
  end
  
end