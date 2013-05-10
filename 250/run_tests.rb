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

PROMPT = "Enter student name or number to withdraw:\n"

class Test250 < MiniTest::Unit::TestCase
  def test_success_by_num
    Student.delete_all

    Student.create(student_number: 1, full_name: "John Smith")
    Student.create(student_number: 2, full_name: "Deb Miller")
    
    with_stdin("1\n") do
      stdout_from { load "250.rb" }.must_equal "#{PROMPT}1 removed.\n"
      Student.where(student_number: 1).count.must_equal 0
      Student.where(student_number: 2).count.must_equal 1
    end
  end
  def test_success_by_name
    Student.delete_all
    Student.create(student_number: 1, full_name: "John Smith")
    Student.create(student_number: 2, full_name: "Deb Miller")
    
    with_stdin("John Smith\n") do
      stdout_from { load "250.rb" }.must_equal "#{PROMPT}John Smith removed.\n"
      Student.where(student_number: 1).count.must_equal 0
      Student.where(student_number: 2).count.must_equal 1
    end
  end
  def test_success_by_name_2
    Student.delete_all
    Student.create(student_number: 1, full_name: "John Smith")
    Student.create(student_number: 2, full_name: "Deb Miller")
    
    with_stdin("Deb Miller\n") do
      stdout_from { load "250.rb" }.must_equal "#{PROMPT}Deb Miller removed.\n"
      Student.where(student_number: 1).count.must_equal 1
      Student.where(student_number: 2).count.must_equal 0
    end
  end
  def test_failure_by_name
    Student.delete_all
    with_stdin("Deb Miller\n") do
      stdout_from { load "250.rb" }.must_equal "#{PROMPT}Deb Miller is not registered.\n"
    end
  end
end
