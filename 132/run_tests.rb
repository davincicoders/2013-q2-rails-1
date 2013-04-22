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
  def test_1_2_3
    with_stdin("1\n2\n3\n\n") do
      stdout_from { load "student_code.rb" }.must_equal("6\n")
    end
  end
  def test_5_7_3
    with_stdin("5\n7\n3\n\n") do
      stdout_from { load "student_code.rb" }.must_equal("15\n")
    end
  end
  def test_17
    with_stdin("17\n\n") do
      stdout_from { load "student_code.rb" }.must_equal("17\n")
    end
  end
  def test_9_9_9_9
    with_stdin("9\n9\n9\n9\n\n") do
      stdout_from { load "student_code.rb" }.must_equal("36\n")
    end
  end
end
