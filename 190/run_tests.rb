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

PROMPT = "Enter a year:\n"

class Test190 < MiniTest::Unit::TestCase
  def test_1789
    with_stdin("1789\n") do
      stdout_from { load "190.rb" }.must_equal "#{PROMPT}George Washington\n"
    end
  end
  def test_2001
    with_stdin("2001\n") do
      stdout_from { load "190.rb" }.must_equal "#{PROMPT}Bill Clinton\nGeorge W. Bush\n"
    end
  end
  def test_1962
    with_stdin("1962\n") do
      stdout_from { load "190.rb" }.must_equal "#{PROMPT}John F. Kennedy\n"
    end
  end
  def test_1963
    with_stdin("1963\n") do
      stdout_from { load "190.rb" }.must_equal "#{PROMPT}John F. Kennedy\nLyndon B. Johnson\n"
    end
  end
  def test_1964
    with_stdin("1964\n") do
      stdout_from { load "190.rb" }.must_equal "#{PROMPT}Lyndon B. Johnson\n"
    end
  end
end
