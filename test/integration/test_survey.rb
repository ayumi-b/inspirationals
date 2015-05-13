require_relative '../test_helper'

class SurveyTest < Minitest::Test

  def test_gives_first_questionnaire
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
