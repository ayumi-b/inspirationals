require_relative '../test_helper'

class TestListingQuotes < Minitest::Test

  def test_listing_no_quotes
    shell_output = ""
    expected_output = ""
    IO.popen('./inspirationals manage', 'r+') do |pipe|
      expected_output << manage_menu
      pipe.puts "3"
      expected_output << "No quotes found. Add a quote.\n"
      pipe.close_write
      shell_output = pipe.read
    end
    assert_equal expected_output, shell_output
  end

  def test_listing_multiple_quotes
    create_quote("Where is your violin?")
    create_quote("Is that the best grade in class?")
    shell_output = ""
    expected_output = ""
    IO.popen('./inspirationals manage', 'r+') do |pipe|
      expected_output << manage_menu
      pipe.puts "4"
      expected_output << "1. Is that the best grade in class?\n"
      expected_output << "2. Where is your violin?\n"
      pipe.close_write
      shell_output = pipe.read
    end
    assert_equal expected_output, shell_output
  end
end
