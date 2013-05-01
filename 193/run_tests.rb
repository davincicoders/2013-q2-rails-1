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

PROMPT = "Enter a first name to look up:\n"

class Test193 < MiniTest::Unit::TestCase
  def test_brad_pitt
    with_stdin("Brad\n") do
      stdout_from { load "193.rb" }.must_equal "#{PROMPT}Brad's last name is Pitt.\n"
    end
  end
  def test_sean_penn
    with_stdin("Sean\n") do
      stdout_from { load "193.rb" }.must_equal "#{PROMPT}Sean's last name is Penn.\n"
    end
  end
  def test_wally_unknown
    with_stdin("Wally\n") do
      stdout_from { load "193.rb" }.must_equal "#{PROMPT}Sorry, Wally was not found.\n"
    end
  end
end
