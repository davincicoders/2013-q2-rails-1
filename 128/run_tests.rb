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

class TestStudentCode < MiniTest::Unit::TestCase
  def test_correct_uuu
    with_stdin("DVC") do
      stdout_from { load "student_code.rb" }.must_equal("Enter the password:\nCorrect\n")
    end
  end
  def test_correct_uul
    with_stdin("DVc") do
      stdout_from { load "student_code.rb" }.must_equal("Enter the password:\nCorrect\n")
    end
  end
  def test_correct_ulu
    with_stdin("DvC") do
      stdout_from { load "student_code.rb" }.must_equal("Enter the password:\nCorrect\n")
    end
  end
  def test_correct_ull
    with_stdin("Dvc") do
      stdout_from { load "student_code.rb" }.must_equal("Enter the password:\nCorrect\n")
    end
  end
  def test_correct_luu
    with_stdin("dVC") do
      stdout_from { load "student_code.rb" }.must_equal("Enter the password:\nCorrect\n")
    end
  end
  def test_correct_lul
    with_stdin("dVc") do
      stdout_from { load "student_code.rb" }.must_equal("Enter the password:\nCorrect\n")
    end
  end
  def test_correct_llu
    with_stdin("dvC") do
      stdout_from { load "student_code.rb" }.must_equal("Enter the password:\nCorrect\n")
    end
  end
  def test_correct_lll
    with_stdin("dvc") do
      stdout_from { load "student_code.rb" }.must_equal("Enter the password:\nCorrect\n")
    end
  end
  def test_rearranged
    with_stdin("cvd") do
      stdout_from { load "student_code.rb" }.must_equal("Enter the password:\nIncorrect\n")
    end
  end
  def test_whitespace_before
    with_stdin(" dvc") do
      stdout_from { load "student_code.rb" }.must_equal("Enter the password:\nIncorrect\n")
    end
  end
  def test_whitespace_after
    with_stdin("dvc ") do
      stdout_from { load "student_code.rb" }.must_equal("Enter the password:\nIncorrect\n")
    end
  end
  def test_other_word
    with_stdin("bluejay") do
      stdout_from { load "student_code.rb" }.must_equal("Enter the password:\nIncorrect\n")
    end
  end
end
