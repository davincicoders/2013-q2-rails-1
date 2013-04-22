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

class TestStudentCode < MiniTest::Unit::TestCase
  def test1
    stdout_from { load "student_code.rb" }.must_equal("4\n")
  end
end
