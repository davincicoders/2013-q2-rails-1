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

PROMPT = "Enter a recipe name (e.g. Brownies):\n"

# TODO: List the names of the other recipes by this same author
# Don't include the recipe name that was entered at the beginning.
class Test192 < MiniTest::Unit::TestCase
  def test_brownies
    with_stdin("Brownies\n") do
      stdout_from { load "192.rb" }.must_equal "#{PROMPT}Chocolate cookies\n"
    end
  end
  def test_cookies
    with_stdin("Chocolate cookies\n") do
      stdout_from { load "192.rb" }.must_equal "#{PROMPT}Brownies\n"
    end
  end
  def test_fudge
    with_stdin("Fudge\n") do
      stdout_from { load "192.rb" }.must_equal "#{PROMPT}Snickerdoodles\n"
    end
  end
  def test_snickerdoodles
    with_stdin("Snickerdoodles\n") do
      stdout_from { load "192.rb" }.must_equal "#{PROMPT}Fudge\n"
    end
  end
end
