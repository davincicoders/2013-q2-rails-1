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
  def test_dawn
    with_stdin("Dawn") do
      stdout_from { load "student_code.rb" }.must_equal("What is your name?\nHello Dawn.\n")
    end
  end
  def test_tim
    with_stdin("Tim") do
      stdout_from { load "student_code.rb" }.must_equal("What is your name?\nHello Tim.\n")
    end
  end
end
