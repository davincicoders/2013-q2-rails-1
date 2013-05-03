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

PROMPT = "Enter the first name of a sales rep:"

class Test197 < MiniTest::Unit::TestCase
  def test_victoria
    with_stdin("Victoria\n") do
      stdout_from { load "197.rb" }.must_equal "#{PROMPT}
Order #1 - Hernando Cordilla - Computers Today - $2.50
Order #3 - Miranda Greenfield - Computers Today, PCs in Education - $4.10
Order #4 - Miranda Greenfield - Computers Today, News for Newbies - $5.00
Order #21 - Juanita Mejia - none - $0.00
Total commission: $11.60
"
    end
  end
  def test_sheila
    with_stdin("Sheila\n") do
      stdout_from { load "197.rb" }.must_equal "#{PROMPT}
Order #2 - Clayton Pounders - News for Techies - $2.00
Order #7 - Sylvia Blintz - Computers Today, News for Techies, PCs in Education - $6.10
Order #10 - Maria Garcia - Computers Today, News for Newbies - $5.00
Order #12 - Nathan Mason - Computers Today - $2.50
Order #17 - Howard Pritchard - Computers Today, PCs in Education - $4.10
Order #18 - Akeda Obama - News for Techies, Computers Today - $4.50
Order #20 - Jose Alverez - News for Newbies - $2.50
Total commission: $26.70
"
    end
  end
  def test_george
    with_stdin("George\n") do
      stdout_from { load "197.rb" }.must_equal "#{PROMPT}
Order #5 - Henry Miller - PCs in Education - $1.60
Order #6 - Simon Potter - News for Techies, PCs in Education - $3.60
Order #11 - Tokiko Tomara - Computers Today - $2.50
Order #13 - Gerald Mason - News for Techies - $2.00
Order #16 - Glenn Grissom - PCs in Education - $1.60
Order #19 - Hector Juarez - PCs in Education - $1.60
Total commission: $12.90
"
    end
  end
  def test_julius
    with_stdin("Julius\n") do
      stdout_from { load "197.rb" }.must_equal "#{PROMPT}
Order #8 - Melanie Wong - Computers Today, News for Newbies - $4.00
Order #9 - Adam Fitzgerald - News for Techies - $1.60
Order #14 - Michelle Rodrigez - News for Newbies, Computers Today, PCs in Education - $5.28
Order #15 - Constance Flannery - Computers Today - $2.00
Total commission: $12.88
"
    end
  end
  def test_unknown
    with_stdin("Bob\n") do
      stdout_from { load "197.rb" }.must_equal "#{PROMPT}\nUnknown sales rep.\n"
    end
  end
end
