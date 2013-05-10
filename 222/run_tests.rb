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
    Cat.delete_all
    Cat.create(name: "Felix", location: "somewhere")
    Cat.create(name: "Fluffy", location: "somewhere")

    load "222.rb"

    Cat.where(name: "Felix").count.must_equal 0
    Cat.where(name: "Fluffy").count.must_equal 1
  end
end
