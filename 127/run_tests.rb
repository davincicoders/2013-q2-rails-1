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
  def test_1_to_2
    with_stdin("1") do
      stdout_from { load "student_code.rb" }.must_equal("Enter a number:\n2\n")
    end
  end
  def test_2_to_3
    with_stdin("2") do
      stdout_from { load "student_code.rb" }.must_equal("Enter a number:\n3\n")
    end
  end
  def test_0_to_1
    with_stdin("0") do
      stdout_from { load "student_code.rb" }.must_equal("Enter a number:\n1\n")
    end
  end
  def test_10_to_11
    with_stdin("10") do
      stdout_from { load "student_code.rb" }.must_equal("Enter a number:\n11\n")
    end
  end
end
