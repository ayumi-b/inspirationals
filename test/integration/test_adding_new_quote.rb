require_relative '../test_helper'

### Adding a New Quote (C)
#In order to be able to enter new inspirations by our wisdom leaders, I want to add the latest and greatest quotes.

#Usage Example:
#> ./inspirationals manage
#```
#1. Add a Dr. Phil quote
#2. Add a Tiger Mom quote
#3. List all Dr. Phil quotes
#4. List all Tiger Mom quotes
#5. Exit
#```
#> 2
#```
#Please type in your 'Tiger Mom' quote.
#```
#> Go practice piano.
#```
#Go practice piano.
#Would you like to?
#1. Add
#2. Edit
#3. Exit
#```
#> 1
#```
#Please enter the quote category for the quote you added.
#```
#> Encouragement
#```
#"Go practice piano." has been added under the category, Encouragement.
#1. Add a Dr. Phil quote
#2. Add a Tiger Mom quote
#3. List all Dr. Phil quotes
#4. List all Tiger Mom quotes
#5. Exit
#```

class AddingNewQuoteTest < Minitest::Test

  def test_adding_a_quote
    shell_output = ""
    expected_output = manage_menu
    test_quote = "Cats are great"
    IO.popen('./inspirationals manage', 'r+') do |pipe|
      pipe.puts "2"
      expected_output << "Please type in your Tiger Mom quote.\n"
      pipe.puts test_quote
      expected_output << "\"#{test_quote}\" has been added.\n"
      expected_output << manage_menu
      pipe.puts "5"
      expected_output << "Tomorrow's just a future yesterday.\n"
      shell_output = pipe.read
      pipe.close_write
      pipe.close_read
    end
    assert_equal expected_output, shell_output
  end

  def test_sad_path_adding_a_quote
    skip
    shell_output = ""
    expected_output = manage_menu
    test_quote = "Cats are great"
    IO.popen('./inspirationals manage', 'r+') do |pipe|
      pipe.puts "2"
      expected_output << "Please type in your Tiger Mom quote.\n"
      pipe.puts ""
      expected_output << "\"\" is not a valid quote.\n"
      expected_output << "Please type in your Tiger Mom quote.\n"
      pipe.puts test_quote
      expected_output << "\"#{test_quote}\" has been added.\n"
      expected_output << manage_menu
      pipe.puts "3"
      expected_output << "1. #{test_quote}"
      shell_output = pipe.read
      pipe.close_write
      pipe.close_read
    end
    assert_equal expected_output, shell_output
  end
end
