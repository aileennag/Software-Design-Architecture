# File: student_test.rb

require 'minitest/autorun'
require 'student'

class StudentTest < Minitest::Test
  
  def setup
    @out = StringIO.new
    @old_stdout = $stdout
    $stdout = @out
    @student1 = Student.new(name: 'John', id: 123, anual_income: 10_000)
    @student2 = Student.new(name: 'Mary', id: 222, anual_income: 25_000)
    @student1.add_grade(90).add_grade(84).add_grade(92)
    
  end
  
  def teardown
    $stdout = @old_stdout
  end
  
  def test_reset_anual_income
    assert_equal 10_000, @student1.reset_anual_income(11_000)
    assert_equal 11_000, @student1.reset_anual_income(15_000)
  end
  
  def test_display_personal_info_and_disclaimer
    @student1.display_personal_info_and_disclaimer
    @student2.display_personal_info_and_disclaimer
    assert_equal \
    "Name: John ID: 123\n"                                            \
    "Anual income: 10000\n"                                           \
    "Grade average: 88.66666666666667\n"                              \
    "The contents of this class must not be considered an offer,\n"   \
    "proposal, understanding or agreement unless it is confirmed\n"   \
    "in a document signed by at least five blood-sucking lawyers.\n"  \
    "Name: Mary ID: 222\n"                                            \
    "Anual income: 25000\n"                                           \
    "Grade average: NaN\n"                                            \
    "The contents of this class must not be considered an offer,\n"   \
    "proposal, understanding or agreement unless it is confirmed\n"   \
    "in a document signed by at least five blood-sucking lawyers.\n" ,\
    @out.string
  end
  
  def test_scolarship_worthy?
      assert @student1.scholarship_worthy?
      assert_raises(RuntimeError){ @student2.scholarship_worthy? }
      @student2.add_grade(90)
      refute @student2.scholarship_worthy?   #refute checks that is false
  end
    
end
