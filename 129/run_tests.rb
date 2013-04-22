require "minitest/autorun"
require "stringio"
require "minitest/reporters"
require "pry"
MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new

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

class TestStudentCode < MiniTest::Unit::TestCase
  def test_1
    with_stdin("1") do
      stdout_from { load "student_code.rb" }.must_equal("Enter a number:\n*\n")
    end
  end
  def test_2
    with_stdin("2") do
      stdout_from { load "student_code.rb" }.must_equal("Enter a number:\n**\n")
    end
  end
  def test_3
    with_stdin("3") do
      stdout_from { load "student_code.rb" }.must_equal("Enter a number:\n***\n")
    end
  end
  def test_10
    with_stdin("10") do
      stdout_from { load "student_code.rb" }.must_equal("Enter a number:\n**********\n")
    end
  end
end
