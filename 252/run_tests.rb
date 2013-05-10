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

class Test252 < MiniTest::Unit::TestCase
  def test_blank
    Student.delete_all
    stdout_from { load "252.rb" }.must_equal "CS101 Intro to Programming\nMA202 Calculus\n"
  end
  def test_deb_in_cs101
    Student.delete_all
    deb = Student.create(student_number: 1, full_name: "Deb Miller")
    Course.find_by_course_number("CS101").students << deb
    stdout_from { load "252.rb" }.must_equal "CS101 Intro to Programming\n  Deb Miller\nMA202 Calculus\n"
  end
  def test_deb_in_both
    Student.delete_all
    deb = Student.create(student_number: 1, full_name: "Deb Miller")
    Course.find_by_course_number("CS101").students << deb
    Course.find_by_course_number("MA202").students << deb
    stdout_from { load "252.rb" }.must_equal "CS101 Intro to Programming\n  Deb Miller\nMA202 Calculus\n  Deb Miller\n"
  end
  def test_deb_in_calc_joe_in_cs101
    Student.delete_all
    deb = Student.create(student_number: 1, full_name: "Deb Miller")
    joe = Student.create(student_number: 2, full_name: "Joe Smith")
    Course.find_by_course_number("MA202").students << deb
    Course.find_by_course_number("CS101").students << joe
    stdout_from { load "252.rb" }.must_equal "CS101 Intro to Programming\n  Joe Smith\nMA202 Calculus\n  Deb Miller\n"
  end
end
