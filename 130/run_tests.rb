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
  def test_la
    with_stdin("la\n1") do
      stdout_from { load "student_code.rb" }.must_equal("Enter a word:\nEnter a number:\nla\n")
    end
  end
  def test_lala
    with_stdin("la\n2") do
      stdout_from { load "student_code.rb" }.must_equal("Enter a word:\nEnter a number:\nlala\n")
    end
  end
  def test_lalala
    with_stdin("la\n3") do
      stdout_from { load "student_code.rb" }.must_equal("Enter a word:\nEnter a number:\nlalala\n")
    end
  end
  def test_haha
    with_stdin("ha\n2") do
      stdout_from { load "student_code.rb" }.must_equal("Enter a word:\nEnter a number:\nhaha\n")
    end
  end
  def test_jjjjj
    with_stdin("j\n5") do
      stdout_from { load "student_code.rb" }.must_equal("Enter a word:\nEnter a number:\njjjjj\n")
    end
  end
end
