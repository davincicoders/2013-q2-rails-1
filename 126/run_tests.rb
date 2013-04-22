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
  def test_correct
    with_stdin("dvc") do
      stdout_from { load "student_code.rb" }.must_equal("Enter the password:\nCorrect\n")
    end
  end
  def test_incorrect
    with_stdin("bluejay") do
      stdout_from { load "student_code.rb" }.must_equal("Enter the password:\nIncorrect\n")
    end
  end
end
