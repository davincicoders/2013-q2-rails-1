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

PROMPT1 = "Enter the course number (e.g. CS101):\n"
PROMPT2 = "Enter the student number:\n"

class Test251 < MiniTest::Unit::TestCase
  def test_cs101_deb
    Student.delete_all
    Student.create(student_number: 1, full_name: "Deb Miller")
    with_stdin("CS101\n1\n") do
      stdout_from { load "251.rb" }.must_equal "#{PROMPT1}#{PROMPT2}"
      Course.find_by_course_number("CS101").students.include?(Student.find_by_full_name("Deb Miller")).must_equal true
      Course.find_by_course_number("CS101").students.count.must_equal 1
      Course.find_by_course_number("MA202").students.count.must_equal 0
    end
  end
  def test_cs101_joe
    Student.delete_all
    Student.create(student_number: 1, full_name: "Deb Miller")
    Student.create(student_number: 2, full_name: "Joe Smith")
    with_stdin("CS101\n2\n") do
      stdout_from { load "251.rb" }.must_equal "#{PROMPT1}#{PROMPT2}"
      Course.find_by_course_number("CS101").students.include?(Student.find_by_full_name("Joe Smith")).must_equal true
      Course.find_by_course_number("CS101").students.count.must_equal 1
      Course.find_by_course_number("MA202").students.count.must_equal 0
    end
  end
  def test_ma202_joe_deb_already
    Student.delete_all
    deb = Student.create(student_number: 1, full_name: "Deb Miller")
    deb.courses << Course.find_by_course_number("MA202")
    Student.create(student_number: 2, full_name: "Joe Smith")
    with_stdin("MA202\n2\n") do
      stdout_from { load "251.rb" }.must_equal "#{PROMPT1}#{PROMPT2}"
      Course.find_by_course_number("MA202").students.include?(Student.find_by_full_name("Joe Smith")).must_equal true
      Course.find_by_course_number("MA202").students.include?(Student.find_by_full_name("Deb Miller")).must_equal true
      Course.find_by_course_number("MA202").students.count.must_equal 2
      Course.find_by_course_number("CS101").students.count.must_equal 0
    end
  end
end
