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

PROMPT = "Enter a list of words, separated by spaces (e.g. big green frog):\n"

class Test163 < MiniTest::Unit::TestCase
  def test_abc
    with_stdin("a b c\n") do
      stdout_from { load "163.rb" }.must_equal("#{PROMPT}c b a\n")
    end
  end
  def test_ab
    with_stdin("a b\n") do
      stdout_from { load "163.rb" }.must_equal("#{PROMPT}b a\n")
    end
  end
  def test_8356
    with_stdin("8 3 5 6\n") do
      stdout_from { load "163.rb" }.must_equal("#{PROMPT}6 5 3 8\n")
    end
  end
  def test_d
    with_stdin("d\n") do
      stdout_from { load "163.rb" }.must_equal("#{PROMPT}d\n")
    end
  end
  def test_none
    with_stdin("\n") do
      stdout_from { load "163.rb" }.must_equal("#{PROMPT}\n")
    end
  end
  def test_big_green_frog
    with_stdin("big green frog\n") do
      stdout_from { load "163.rb" }.must_equal("#{PROMPT}frog green big\n")
    end
  end
end
