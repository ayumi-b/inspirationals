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

  def test_gives_minimum_arguments
    shell_output = ""
    expected_output = ""
    IO.popen('./inspirationals') do |pipe|
      expected_output = "[Help] Run as: ./inspirationals manage"
      shell_output = pipe.read
    end
    assert_equal expected_output, shell_output
  end

  def test_manage_argument_not_given
    shell_output = ""
    expected_output = ""
    IO.popen('./inspirationals cats') do |pipe|
      expected_output = "[Help] Run as: ./inspirationals manage"
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
