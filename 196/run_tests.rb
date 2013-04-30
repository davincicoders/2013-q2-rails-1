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

PROMPT = "Please enter the name of an actor (first and last name):\n"

class Test196 < MiniTest::Unit::TestCase
  def test_brad_pitt
    with_stdin("Brad Pitt\n") do
      stdout_from { load "196.rb" }.must_equal "#{PROMPT}Moneyball\nThe Tree of Life\nOcean's Eleven\n"
    end
  end
  def test_meryl_streep
    with_stdin("Meryl Streep\n") do
      stdout_from { load "196.rb" }.must_equal "#{PROMPT}The Iron Lady\n"
    end
  end
  def test_sean_penn
    with_stdin("Sean Penn\n") do
      stdout_from { load "196.rb" }.must_equal "#{PROMPT}The Tree of Life\n"
    end
  end
  def test_george_clooney
    with_stdin("George Clooney\n") do
      stdout_from { load "196.rb" }.must_equal "#{PROMPT}The Descendants\nOcean's Eleven\n"
    end
  end
end
