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

class Test220 < MiniTest::Unit::TestCase
  def test1
    load "220.rb"

    cats = Cat.all
    cats.size.must_equal 3
    cats[0].class.must_equal Cat
    cats[0].name.must_equal "Fluffy"
    cats[0].location.must_equal "in a box"
    cats[1].class.must_equal Cat
    cats[1].name.must_equal "Furry"
    cats[1].location.must_equal "in a box"
    cats[2].class.must_equal Cat
    cats[2].name.must_equal "Felix"
    cats[2].location.must_equal "in a box"
  end
end
