require "highline/import"


class SurveyController

  def quiz
    choose do |menu|
      menu.header = "Welcome to Inspirationals.\n" + "Choose one.\n"
      menu.choice("I want to be inspired by Dr. Phil.") { index}
      menu.choice("I want to be inspired by Tiger Mom."){ tiger_mom}
      menu.choice("Exit. I need rational thought.") do
        exit
      end
    end
  end
  
  def dr_phil
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

  def index
    if Quote.count > 0
      quotes = Quote.all
      choose do |menu|
        menu.header = "Which one would you like?"
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
