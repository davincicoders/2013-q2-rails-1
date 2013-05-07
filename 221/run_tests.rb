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

class Test221 < MiniTest::Unit::TestCase
  def test1
    Cat.update_all "location = 'somewhere else'", "name = 'Fluffy'"
    Cat.update_all "location = 'somewhere else'", "name = 'Felix'"

    load "221.rb"

    Cat.where(name: "Fluffy").first.location.must_equal "on the sofa"
    Cat.where(name: "Felix").first.location.must_equal "under the bed"
  end
end
