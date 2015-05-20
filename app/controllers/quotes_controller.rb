require "highline/import"

class QuotesController


  def index_phil
    if Quote.count > 0
      quotes = Database.execute("SELECT name FROM quotes WHERE author_id==1")
      choose do |menu|
        menu.header = "Please pick which Dr. Phil inspirational you'd like to access.\n"
        quotes.each do |dr_quotes|
          quotes = dr_quotes['name']
          menu.choice(quotes){ action_menu(quotes)}
        end
        menu.choice("Exit. Please let me out.") do
          say("Have a good day.")
          exit
        end
      end
    else
      say("there are no quotes found. Add a quote.\n")
    end
  end

  def index_tiger
    if Quote.count > 0
      quotes = Database.execute("SELECT name FROM quotes WHERE author_id==2")
      choose do |menu|
        menu.header = "Please pick which Tiger Mom inspirational you'd like to access.\n"
        quotes.each do |dr_quotes|
          quotes = dr_quotes['name']
          menu.choice(quotes){ action_menu(quotes)}
        end
        menu.choice("Exit. Please Let me out.") do
          say("Have a good day.")
          exit
        end
      end
    else
      say("there are no quotes found. Add a quote.\n")
    end
  end

  def action_menu(quote)
    say("Would you like to?")
    choose do |menu|
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

  def add_tiger
    loop do
          user_input = ask("Please type in your Tiger Mom quote.")
          response = quotes_controller.add(user_input)
          say(response) unless response.nil?
          if /has\sbeen\sadded.$/.match(response)
            break
          end
        end
  end

  def add_phil
        loop do
          user_input = ask("Please type in your Dr. Phil quote.")
          response = quotes_controller.add(user_input)
          say(response) unless response.nil?
          if /has\sbeen\sadded.$/.match(response)
            break
          end
        end
  end

  def add(name, author_id, quote_type_id )
    name_cleaned = name.strip
    quote = Quote.new(name_cleaned)
    if quote.save
      "\"#{quote}\" has been added.\n"
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
