require "highline/import"

class SurveyController

  def survey_menu
<<EOS
Welcome to inspirationals.  Choose one.
1. I want to be inspired by Dr. Phil.
2. I want to be inspired by Tiger Mom.
EOS
  end 

  def type_menu
<<EOS
Select an inspiration that you need.
1. Comfort
2. Support
3. Security
4. A way out of a situation
5. Decision
6. Challenge
EOS
  end



  def index
    if Quote.count > 0
      quotes = Quote.all
      choose do |menu|
        menu.prompt = ""
        quotes.each do |quote|
          menu.choice(quote.name){ action_menu(quote)}
        end
        menu.choice("Exit")
      end
    else
      say("there are no quotes found. Add a quote.\n")
    end
  end

  def action_menu(quote)
    say("Would you like to?")
    choose do |menu|
      menu.prompt = ""
      menu.choice("Edit") do
        edit(quote)
      end
      menu.choice("Delete") do
        destroy(quote)
      end
      menu.choice("Exit") do
        exit
      end
    end
  end

  def add(name)
    name_cleaned = name.strip
    quote = Quote.new(name_cleaned)
    if quote.save
      "\"#{name}\" has been added.\n"
    else
      quote.errors
    end
  end
end
