require "minitest/autorun"
require "stringio"
require "minitest/reporters"
require "pry"
MiniTest::Reporters.use! MiniTest::Reporters::SpecReporter.new
require "./connect_to_db.rb"

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

class Test222 < MiniTest::Unit::TestCase
  def test1
    if Cat.where(name: "Felix").count > 0
      Cat.create(name: "Flex", location: "somewhere")
    end

    load "222.rb"

    Cat.where(name: "Felix").count.must_equal 0
  end
end
