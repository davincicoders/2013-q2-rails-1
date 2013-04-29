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

PROMPT1 = "Enter username:\n"
PROMPT2 = "Enter password:\n"

class Test189 < MiniTest::Unit::TestCase
  def test_unknown_username
    with_stdin("Greg\nfrog\n") do
      stdout_from { load "189.rb" }.must_equal "#{PROMPT1}#{PROMPT2}Unknown username.\n"
    end
  end
  def test_incorrect_password1
    with_stdin("Jen\nlook\n") do
      stdout_from { load "189.rb" }.must_equal "#{PROMPT1}#{PROMPT2}Incorrect password.\n"
    end
  end
  def test_correct_password1
    with_stdin("Jen\nlock\n") do
      stdout_from { load "189.rb" }.must_equal "#{PROMPT1}#{PROMPT2}Correct password.\n"
    end
  end
  def test_incorrect_password2
    with_stdin("Jim\nrook\n") do
      stdout_from { load "189.rb" }.must_equal "#{PROMPT1}#{PROMPT2}Incorrect password.\n"
    end
  end
  def test_correct_password2
    with_stdin("Jim\nrock\n") do
      stdout_from { load "189.rb" }.must_equal "#{PROMPT1}#{PROMPT2}Correct password.\n"
    end
  end
end
