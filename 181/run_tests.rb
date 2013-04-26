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

class Test181 < MiniTest::Unit::TestCase
  def test1
    File.delete('181.html')

    with_stdin("games1.csv\n") do
      stdout_from { load "181.rb" }.must_equal PROMPT
    end

    File.read('181.html').chomp.must_equal("<html>
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
        <td><b>Broncos</b></td>
        <td><b>31</b></td>
      </tr>
      <tr>
        <td>9/17</td>
        <td>Broncos</td>
        <td>21</td>
        <td><b>Falcons</b></td>
        <td><b>27</b></td>
      </tr>
      <tr>
        <td>9/23</td>
        <td><b>Texans</b></td>
        <td><b>31</b></td>
        <td>Broncos</td>
        <td>25</td>
      </tr>
      <tr>
        <td>9/30</td>
        <td>Raiders</td>
        <td>6</td>
        <td><b>Broncos</b></td>
        <td><b>37</b></td>
      </tr>
    </table>
  </body>
</html>".chomp)
  end
  def test2
    File.delete('181.html')

    with_stdin("games2.csv\n") do
      stdout_from { load "181.rb" }.must_equal PROMPT
    end

    File.read('181.html').chomp.must_equal("<html>
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
        <td><b>Patriots</b></td>
        <td><b>31</b></td>
      </tr>
      <tr>
        <td>10/15</td>
        <td><b>Broncos</b></td>
        <td><b>35</b></td>
        <td>Chargers</td>
        <td>24</td>
      </tr>
      <tr>
        <td>10/28</td>
        <td>Saints</td>
        <td>14</td>
        <td><b>Broncos</b></td>
        <td><b>34</b></td>
      </tr>
      <tr>
        <td>11/4</td>
        <td><b>Broncos</b></td>
        <td><b>31</b></td>
        <td>Bengals</td>
        <td>23</td>
      </tr>
      <tr>
        <td>11/11</td>
        <td><b>Broncos</b></td>
        <td><b>36</b></td>
        <td>Pathers</td>
        <td>14</td>
      </tr>
    </table>
  </body>
</html>".chomp)
  end
  def test3
    File.delete('181.html')

    with_stdin("games3.csv\n") do
      stdout_from { load "181.rb" }.must_equal PROMPT
    end

    File.read('181.html').chomp.must_equal("<html>
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
        <td><b>Broncos</b></td>
        <td><b>30</b></td>
      </tr>
      <tr>
        <td>11/25</td>
        <td><b>Broncos</b></td>
        <td><b>17</b></td>
        <td>Chiefs</td>
        <td>9</td>
      </tr>
    </table>
  </body>
</html>".chomp)
  end
end
