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

PROMPT = "Enter a movie title to see its awards:\n"

class Test194 < MiniTest::Unit::TestCase
  def test_the_artist
    with_stdin("The Artist\n") do
      stdout_from { load "194.rb" }.must_equal "#{PROMPT}Best Picture\nBest Actor\n"
    end
  end
  def test_the_iron_lady
    with_stdin("The Iron Lady\n") do
      stdout_from { load "194.rb" }.must_equal "#{PROMPT}Best Actress\n"
    end
  end
  def test_hugo
    with_stdin("Hugo\n") do
      stdout_from { load "194.rb" }.must_equal "#{PROMPT}This movie didn't win any awards.\n"
    end
  end
  def test_not_found
    with_stdin("ASDFGHJKL\n") do
      stdout_from { load "194.rb" }.must_equal "#{PROMPT}Sorry, ASDFGHJKL was not found.\n"
    end
  end
end
