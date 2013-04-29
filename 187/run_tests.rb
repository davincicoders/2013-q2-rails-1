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

PROMPTS = "Property type (Public, Private, Parks and Rec, RTD, or leave blank):
Power type (Wired Only, Solar Only, Solar w/Wire Back-up, or leave blank):
Word to search for in station name, or leave blank:"

class Test187 < MiniTest::Unit::TestCase
  def test_all
    with_stdin("\n\n\n") do
      stdout_from { load "187.rb" }.must_equal "#{PROMPTS}
9th and Logan
13th and Marion
13th and Speer
14th and Ogden
15th and Curtis
1551 Lafayette
17th and Franklin
18th and Arapahoe
23rd and Clay
32nd and Clay
32nd and Julian
Colfax and Garfield
Union Station Light Rail at 17th St.
17th St and Tejon
1st and Broadway
Colfax and Steele
Colfax and Gaylord
Bayaud and Pennsylvania
Colfax and Columbine
6th and Clarkson
12th and Columbine
20th and Chestnut
33rd and Zuni
Bayaud and Emerson
17th and Race
17th and Downing
17th and Pearl
11th and Emerson
12th and Sherman
1450 Wazee
15th and Cleveland
15th and Delgany
1550 Glenarm
16th and Boulder
16th and Broadway
16th and Little Raven
16th and Platte
16th and Sherman
17th and Blake
17th and Curtis
17th and Larimer
18th and California
19th and Market
19th and Pearl
19th and Wynkoop
2045 Franklin
1350 Larimer
14th and Champa
14th and Elati
22nd and Market
22nd and Pennsylvania
25th and Lawrence
14th and Welton
28th and Larimer
Broadway and Walnut
Buchtel and High Light Rail
250 Columbine
3rd and Milwaukee
4th and Walnut
7th and Grant
9th and Downing
9th and Santa Fe
10th and Osage
11th and Broadway
Cherry Creek Mall
Denver Botanic Gardens
Denver Health
Denver Museum of Nature and Science
Denver Public Library
Denver Zoo
DU Driscoll Center
Ellsworth and Madison
Five Points
Florida and S Pearl
Louisiana and Franklin
Louisiana Pearl Light Rail
Market Street Station
Park Ave West and Tremont
Pepsi Center
REI
Webb Building
9th and Curtis
13th and Pearl
"
    end
  end
  def test_rtd
    with_stdin("RTD\n\n\n") do
      stdout_from { load "187.rb" }.must_equal "#{PROMPTS}
Union Station Light Rail at 17th St.
Buchtel and High Light Rail
Louisiana Pearl Light Rail
Market Street Station
"
    end
  end
  def test_solar_wire_backup
    with_stdin("\nSolar w/Wire Back-up\n\n") do
      stdout_from { load "187.rb" }.must_equal "#{PROMPTS}
1350 Larimer
22nd and Pennsylvania
25th and Lawrence
DU Driscoll Center
Park Ave West and Tremont
Pepsi Center
REI
"
    end
  end
  def test_curtis
    with_stdin("\n\nCurtis\n") do
      stdout_from { load "187.rb" }.must_equal "#{PROMPTS}
15th and Curtis
17th and Curtis
9th and Curtis
"
    end
  end
  def test_rtd_and_solar
    with_stdin("RTD\nSolar Only\n\n") do
      stdout_from { load "187.rb" }.must_equal "#{PROMPTS}
Buchtel and High Light Rail
Louisiana Pearl Light Rail
"
    end
  end
  def test_wired_and_17th
    with_stdin("\nWired Only\n17th\n") do
      stdout_from { load "187.rb" }.must_equal "#{PROMPTS}
Union Station Light Rail at 17th St.
17th and Race
17th and Curtis
17th and Larimer
"
    end
  end
end
