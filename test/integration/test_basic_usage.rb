require_relative '../test_helper'

class TestBasicUsage < Minitest::Test

  def test_gives_minimum_arguments
    shell_output = ""
    expected_output = ""
    IO.popen('./inspirationals') do |pipe|
      expected_output = "[Help] Run as: ./inspirationals manage\n"
      shell_output = pipe.read
    end
    assert_equal expected_output, shell_output
  end

  def test_manage_argument_not_given
    shell_output = ""
    expected_output = ""
    IO.popen('./inspirationals cats') do |pipe|
      expected_output = "[Help] Run as: ./inspirationals manage\n"
      shell_output = pipe.read
    end
    assert_equal expected_output, shell_output
  end

  def test_manage_correct_argument_then_exit
    shell_output = ""
    expected_output = ""
    IO.popen('./inspirationals manage', 'r+') do |pipe|
      expected_output =<<EOS
1. Add a Dr. Phil quote
2. Add a Tiger Mom quote
3. List all Dr. Phil quotes
4. List all Tiger Mom quotes
5. Exit
EOS
      pipe.puts "5"
      expected_output << "Tomorrow's just a future yesterday.\n"
      pipe.close_write
      shell_output = pipe.read
    end
    assert_equal expected_output, shell_output
  end





end
