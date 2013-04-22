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
  def test_pots_to_stop
    with_stdin("POTS") do
      stdout_from { load "student_code.rb" }.must_equal("Enter a line of input:\nSTOP\n")
    end
  end
  def test_look_to_kool
    with_stdin("LOOK") do
      stdout_from { load "student_code.rb" }.must_equal("Enter a line of input:\nKOOL\n")
    end
  end
end
