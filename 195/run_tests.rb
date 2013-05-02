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

PROMPT = "Enter a movie title to see its actors (limited to this tiny database):\n"

class Test195 < MiniTest::Unit::TestCase
  def test_moneyball
    with_stdin("Moneyball\n") do
      stdout_from { load "195.rb" }.must_equal "#{PROMPT}Brad Pitt\n"
    end
  end
  def test_the_iron_lady
    with_stdin("The Iron Lady\n") do
      stdout_from { load "195.rb" }.must_equal "#{PROMPT}Meryl Streep\n"
    end
  end
  def test_not_found
    with_stdin("ASDFGHJKL\n") do
      stdout_from { load "195.rb" }.must_equal "#{PROMPT}Sorry, ASDFGHJKL was not found.\n"
    end
  end
end
