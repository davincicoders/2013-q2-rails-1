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

class Test178 < MiniTest::Unit::TestCase
  def test1
    File.open('input.txt', 'w') do |file|
      file.write("This is the first line.\nThis is the second line.\nThis is the third line.\n")
    end
    File.delete('178.html')

    load "178.rb"

    File.read('178.html').chomp.must_equal("<html>
  <body>
    <h1>Headline</h1>
    <p>This is the first line.</p>
    <p>This is the second line.</p>
    <p>This is the third line.</p>
  </body>
</html>".chomp)
  end
  def test2
    File.open('input.txt', 'w') do |file|
      file.write("A is for alligator.\nB is for baboon.\n")
    end
    File.delete('178.html')

    load "178.rb"

    File.read('178.html').chomp.must_equal("<html>
  <body>
    <h1>Headline</h1>
    <p>A is for alligator.</p>
    <p>B is for baboon.</p>
  </body>
</html>".chomp)
  end
end
