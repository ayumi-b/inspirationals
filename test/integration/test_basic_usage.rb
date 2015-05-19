require_relative '../test_helper'

class TestBasicUsage < Minitest::Test

  def test_manage_wrong_arguments
    shell_output = ""
    expected_output = ""
    IO.popen('./inspirationals bob') do |pipe|
      expected_output = "[Help] Run as: ./inspirationals manage\n"
      shell_output = pipe.read
    end
    assert_equal expected_output, shell_output
  end

  def test_manage_multiple_arguments_given
    shell_output = ""
    expected_output = ""
    IO.popen('./inspirationals manage cats') do |pipe|
      expected_output = "[Help] Run as: ./inspirationals manage\n"
      shell_output = pipe.read
    end
    assert_equal expected_output, shell_output
  end

  def test_manage_correct_argument_then_exit
    shell_output = ""
    expected_output = ""
    IO.popen('./inspirationals manage', 'r+') do |pipe|
      expected_output << manage_menu
      pipe.puts "5"
      expected_output << "Tomorrow's just a future yesterday.\n"
      pipe.close_write
      shell_output = pipe.read
    end
    assert_equal expected_output, shell_output
  end





end
