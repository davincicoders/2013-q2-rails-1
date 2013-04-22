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
  def test_abc
    with_stdin("a\nb\nc\n\n") do
      stdout_from { load "student_code.rb" }.must_equal("a\nb\nc\n")
    end
  end
  def test_12345
    with_stdin("1\n2\n3\n4\n5\n\n") do
      stdout_from { load "student_code.rb" }.must_equal("1\n2\n3\n4\n5\n")
    end
  end
end
