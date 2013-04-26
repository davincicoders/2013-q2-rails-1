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

PROMPT = "Enter CSV filename to load:\n"

class Test180 < MiniTest::Unit::TestCase
  def test1
    File.delete('180.html')

    with_stdin("games1.csv\n") do
      stdout_from { load "180.rb" }.must_equal PROMPT
    end

    File.read('180.html').chomp.must_equal("<html>
  <body>
    <table border='1'>
      <tr>
        <th>Date</th>
        <th>Away team</th>
        <th>Away team's score</th>
        <th>Home team</th>
        <th>Home team's score</th>
      </tr>
      <tr>
        <td>9/9</td>
        <td>Steelers</td>
        <td>19</td>
        <td>Broncos</td>
        <td>31</td>
      </tr>
      <tr>
        <td>9/17</td>
        <td>Broncos</td>
        <td>21</td>
        <td>Falcons</td>
        <td>27</td>
      </tr>
      <tr>
        <td>9/23</td>
        <td>Texans</td>
        <td>31</td>
        <td>Broncos</td>
        <td>25</td>
      </tr>
      <tr>
        <td>9/30</td>
        <td>Raiders</td>
        <td>6</td>
        <td>Broncos</td>
        <td>37</td>
      </tr>
    </table>
  </body>
</html>".chomp)
  end
  def test2
    File.delete('180.html')

    with_stdin("games2.csv\n") do
      stdout_from { load "180.rb" }.must_equal PROMPT
    end

    File.read('180.html').chomp.must_equal("<html>
  <body>
    <table border='1'>
      <tr>
        <th>Date</th>
        <th>Away team</th>
        <th>Away team's score</th>
        <th>Home team</th>
        <th>Home team's score</th>
      </tr>
      <tr>
        <td>10/7</td>
        <td>Broncos</td>
        <td>21</td>
        <td>Patriots</td>
        <td>31</td>
      </tr>
      <tr>
        <td>10/15</td>
        <td>Broncos</td>
        <td>35</td>
        <td>Chargers</td>
        <td>24</td>
      </tr>
      <tr>
        <td>10/28</td>
        <td>Saints</td>
        <td>14</td>
        <td>Broncos</td>
        <td>34</td>
      </tr>
      <tr>
        <td>11/4</td>
        <td>Broncos</td>
        <td>31</td>
        <td>Bengals</td>
        <td>23</td>
      </tr>
      <tr>
        <td>11/11</td>
        <td>Broncos</td>
        <td>36</td>
        <td>Pathers</td>
        <td>14</td>
      </tr>
    </table>
  </body>
</html>".chomp)
  end
  def test3
    File.delete('180.html')

    with_stdin("games3.csv\n") do
      stdout_from { load "180.rb" }.must_equal PROMPT
    end

    File.read('180.html').chomp.must_equal("<html>
  <body>
    <table border='1'>
      <tr>
        <th>Date</th>
        <th>Away team</th>
        <th>Away team's score</th>
        <th>Home team</th>
        <th>Home team's score</th>
      </tr>
      <tr>
        <td>11/18</td>
        <td>Chargers</td>
        <td>23</td>
        <td>Broncos</td>
        <td>30</td>
      </tr>
      <tr>
        <td>11/25</td>
        <td>Broncos</td>
        <td>17</td>
        <td>Chiefs</td>
        <td>9</td>
      </tr>
    </table>
  </body>
</html>".chomp)
  end
end
