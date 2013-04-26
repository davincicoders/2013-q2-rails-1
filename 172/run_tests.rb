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

class Test172 < MiniTest::Unit::TestCase
  def test1
    with_stdin("robot 1 move 2 steps forward\n\n") do
      stdout_from { load "172.rb" }.must_equal("Robot 1 is 2 steps forward.\nRobot 2 is 0 steps forward.\n")
    end
  end
  def test2
    with_stdin("robot 1 move 2 steps forward\nrobot 1 move 3 steps backward\n\n") do
      stdout_from { load "172.rb" }.must_equal("Robot 1 is 1 step backward.\nRobot 2 is 0 steps forward.\n")
    end
  end
  def test3
    with_stdin("robot 2 move 2 steps forward\nrobot 1 move 3 steps backward\nrobot 2 move 3 steps forward\n\n") do
      stdout_from { load "172.rb" }.must_equal("Robot 1 is 3 steps backward.\nRobot 2 is 5 steps forward.\n")
    end
  end
end
