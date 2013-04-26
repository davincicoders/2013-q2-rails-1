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

PROMPT = "Enter CSV filename to load:\n"

class Test176 < MiniTest::Unit::TestCase
  def test1
    with_stdin("games1.csv\n") do
      stdout_from { load "176.rb" }.must_equal("#{PROMPT}Wins: 9/9, 9/30\nLosses: 9/17, 9/23\n")
    end
  end
  def test2
    with_stdin("games2.csv\n") do
      stdout_from { load "176.rb" }.must_equal("#{PROMPT}Wins: 10/15, 10/28, 11/4, 11/11\nLosses: 10/7\n")
    end
  end
  def test3
    with_stdin("games3.csv\n") do
      stdout_from { load "176.rb" }.must_equal("#{PROMPT}Wins: 11/18, 11/25\nLosses: \n")
    end
  end
end
