require_relative '../test_helper.rb'

class TestListingQuotes < Minitest::Test

  def test_no_quotes
    shell_output = ""
    expected_output = ""
    IO.popen('./inspirationals cats') do |pipe|
      expected_output = "[Help] Run as: ./inspirationals manage"
      shell_output = pipe.read
    end
    assert_equal expected_output, shell_output
  end

  def test_no_quotes
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
      pipe.puts "3"
      expected_output << "No quotes by Dr. Phil. Please add one.\n"
      pipe.close_write
      shell_output = pipe.read
    end
    assert_equal expected_output, shell_output
  end

end
