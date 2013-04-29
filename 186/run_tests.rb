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

PROMPT = "Enter of the following time zones: 8:00 a.m., 9:00 a.m., 10:00 a.m., 11:00 a.m., 12:00 noon, 1:00 p.m."

class Test186 < MiniTest::Unit::TestCase
  def test_11_am
    with_stdin("11:00 a.m.\n") do
      stdout_from { load "186.rb" }.must_equal "#{PROMPT}
Amarillo, Tex.
Austin, Tex.
Birmingham, Ala.
Bismarck, N.D.
Chicago, Ill.
Dallas, Tex.
Des Moines, Iowa
Dubuque, Iowa
Duluth, Minn.
Fargo, N.D.
Fort Worth, Tex.
Hot Springs, Ark.
Houston, Tex.
Jackson, Miss.
Kansas City, Mo.
Lincoln, Neb.
Memphis, Tenn.
Milwaukee, Wis.
Minneapolis, Minn.
Mobile, Ala.
Montgomery, Ala.
Nashville, Tenn.
New Orleans, La.
Oklahoma City, Okla.
Omaha, Neb.
Pierre, S.D.
St. Louis, Mo.
San Antonio, Tex.
Shreveport, La.
Sioux Falls, S.D.
Springfield, Ill.
Springfield, Mo.
Tulsa, Okla.
Wichita, Kan.
"
    end
  end
   def test_noon
    with_stdin("12:00 noon\n") do
      stdout_from { load "186.rb" }.must_equal "#{PROMPT}
Albany, N.Y.
Atlanta, Ga.
Baltimore, Md.
Bangor, Maine
Boston, Mass.
Buffalo, N.Y.
Charleston, S.C.
Charleston, W. Va.
Charlotte, N.C.
Cincinnati, Ohio
Cleveland, Ohio
Columbia, S.C.
Columbus, Ohio
Detroit, Mich.
Eastport, Maine
Grand Rapids, Mich.
Indianapolis, Ind.
Jacksonville, Fla.
Key West, Fla.
Knoxville, Tenn.
Louisville, Ky.
Manchester, N.H.
Miami, Fla.
Montpelier, Vt.
Newark, N.J.
New Haven, Conn.
New York, N.Y.
Philadelphia, Pa.
Pittsburgh, Pa.
Portland, Maine
Providence, R.I.
Raleigh, N.C.
Richmond, Va.
Roanoke, Va.
Savannah, Ga.
Springfield, Mass.
Syracuse, N.Y.
Tampa, Fla.
Toledo, Ohio
Virginia Beach, Va.
Washington, D.C.
Wilmington, N.C.
"
    end
  end
  def test_1_pm
    with_stdin("1:00 p.m.\n") do
      stdout_from { load "186.rb" }.must_equal "#{PROMPT}\nSan Juan, P.R.\n"
    end
  end
end
