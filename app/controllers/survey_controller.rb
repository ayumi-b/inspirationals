require "highline/import"


class SurveyController

  def quiz
    choose do |menu|
      menu.header = "Welcome to Inspirationals.\n" + "Choose one.\n"
      menu.choice("I want to be inspired by Dr. Phil.") { index_phil}
      menu.choice("I want to be inspired by Tiger Mom."){ index }
      menu.choice("Exit. I need rational thought.") do
        say("Very well.\n'Tomorrow's just a future yesterday.' --Craig Ferguson")
        exit
      end
    end
  end

  def dr_phil
    selected = Database.execute("SELECT name FROM quotes WHERE author_id = 1")
      choose do |menu|
        menu.header = "Here are some inspiring quotes by the great Dr. Phil.\n"
        selected.each do |selected|
        menu.choice(selected){ action_menu(selected)}
        end
        menu.choice("Exit") do
        exit
      end
    end
  end

  def index_phil
    emotions = Database.execute("SELECT type FROM quote_types")
       choose do |menu|
         menu.header = "What sort of inspiration do you seek today?"
       emotions.each do |emotions|
         menu.choice(emotions) { dr_phil }
       end
       end
  end


  def index
    emotions = Database.execute("SELECT type FROM quote_types")
       choose do |menu|
         menu.header = "What sort of inspiration do you seek today?"
       emotions.each do |emotions|
         menu.choice(emotions) { tiger_mom}
       end
       end
  end
  
  def tiger_mom
    selected = Database.execute("SELECT name FROM quotes WHERE author_id == 2")
      choose do |menu|
        menu.header = "Here are some inspiring quotes by the great Tiger Mom.\n"
        selected.each do |selected|
        menu.choice(selected){ action_menu(selected)}
        end
        menu.choice("Exit") do
         say("get out!")
          exit
        end
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
end
