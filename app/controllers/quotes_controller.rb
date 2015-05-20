require "highline/import"

class QuotesController
  def index
    if Quote.count > 0
      quotes = Database.execute("SELECT name FROM quotes WHERE author_id==1")
      #dr_quotes = quotes[0]['name']
      choose do |menu|
        menu.prompt = ""
        quotes.each do |dr_quotes|
          quotes = dr_quotes['name']
          menu.choice(quotes){ action_menu(quotes)}
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

  def edit(quote)
    loop do
      user_input = user_input.strip
      if quote.save
        say("Quote has been updated to: \"#{scenario.name}\"")
        return
      else
        say(quote.errors)  
      end
    end
  end

  def save
    return false unless valid?
    Database.execute()
  end
end
