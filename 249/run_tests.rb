require "minitest/autorun"
require "stringio"
require "minitest/reporters"
require "pry"
MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new
require './connect_to_db.rb'

def stdout_from
  out = StringIO.new
  $stdout = out
  yield
  return out.string
ensure
  $stdout = STDOUT
end

def with_stdin(input)
  $stdin = StringIO.new(input)
  yield
ensure
  $stdin = STDIN
end

PROMPT1 = "Enter new student number:\n"
PROMPT2 = "Enter new student's full name:\n"
SUCCESS = "Student successfully added.\n"

class Test249 < MiniTest::Unit::TestCase
  def test_success_1
    Student.delete_all
    
    with_stdin("1\nJohn Smith\n") do
      stdout_from { load "249.rb" }.must_equal "#{PROMPT1}#{PROMPT2}#{SUCCESS}"
      Student.where(student_number: 1, full_name: "John Smith").count.must_equal 1
    end
  end
  def test_success_2
    Student.delete_all
    Student.create(student_number: 1, full_name: "John Smith")
    
    with_stdin("2\nJohn Smith\n") do
      stdout_from { load "249.rb" }.must_equal "#{PROMPT1}#{PROMPT2}#{SUCCESS}"
      Student.where(student_number: 2, full_name: "John Smith").count.must_equal 1
    end
  end
  def test_dup_student_num
    Student.delete_all
    Student.create(student_number: 1, full_name: "John Smith")
    
    with_stdin("1\nJohn Smith\n") do
      stdout_from { load "249.rb" }.must_equal "#{PROMPT1}#{PROMPT2}Student number has already been taken\n"
    end
  end
  def test_blank_student_num
    Student.delete_all
    
    with_stdin("\nJohn Smith\n") do
      stdout_from { load "249.rb" }.must_equal "#{PROMPT1}#{PROMPT2}Student number can't be blank\n"
      Student.count.must_equal 0
    end
  end
  def test_blank_name
    Student.delete_all
    
    with_stdin("1\n\n") do
      stdout_from { load "249.rb" }.must_equal "#{PROMPT1}#{PROMPT2}Full name can't be blank\n"
      Student.count.must_equal 0
    end
  end
  def test_both_blank
    Student.delete_all
    
    with_stdin("\n\n") do
      stdout_from { load "249.rb" }.must_equal "#{PROMPT1}#{PROMPT2}Student number can't be blank\nFull name can't be blank\n"
      Student.count.must_equal 0
    end
  end
end
