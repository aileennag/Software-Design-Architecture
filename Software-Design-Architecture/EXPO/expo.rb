class StudentClass

  def initialize()
    @id = "A01372276"
  end
  
  def id
    @id
  end
  
end



def update_grade(grade)
  
  puts "grade updated #{grade}"

end

@student1 = StudentClass.new();

grade = Integer(gets)

if grade >= 90
  
  id = @student1.id.to_s
	letterGrade = "A"
	puts "Student #{id} grade is #{letterGrade}"
	update_grade(letterGrade)
	
elsif grade >= 80

	id = @student1.id.to_s
	letterGrade = "B"
	puts "Student #{id} grade is #{letterGrade}"
	update_grade(letterGrade)

elsif grade >= 70

	id = @student1.id.to_s
	letterGrade = "C"
	puts "Student #{id} grade is #{letterGrade}"
	update_grade(letterGrade)

else 
  
	id = @student1.id.to_s
	letterGrade = "F"
	puts "Student #{id} grade is #{letterGrade}"
	update_grade(letterGrade)
	
end


@student1 = StudentClass.new()

#puts "Enter your mark":
grade = Integer(gets)



id = @student1.id.to_s

if grade >= 90

	letterGrade = "A"
	puts "Student #{id} grade is #{letterGrade}"

elsif grade >= 80

	letterGrade = "B"
	puts "Student #{id} grade is #{letterGrade}"

elsif grade >= 70

	letterGrade = "C"
	puts "Student #{id} grade is #{letterGrade}"
	
else 
  
	letterGrade = "F"
	puts "Student #{id} grade is #{letterGrade}"
	
end

update_grade(letterGrade)

