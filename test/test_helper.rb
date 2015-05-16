require 'rubygems'
require 'bundler/setup'
require "minitest/reporters"
Dir["./app/**/*.rb"].each { |f| require f }
Dir["./lib/*.rb"].each { |f| require f }
ENV["TEST"] = "true"

reporter_options = { color: true }
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(reporter_options)]

require 'minitest/autorun'
class Minitest::Test
  def setup
    Database.load_structure
    Database.execute("DELETE FROM quotes;")
  end
end

def create_quote(name)
  Database.execute("INSERT INTO quotes (name) VALUES (?)", name)
end


def manage_menu
<<EOS
1. Add a Dr. Phil quote
2. Add a Tiger Mom quote
3. List all Dr. Phil quotes
4. List all Tiger Mom quotes
5. Exit
EOS
end

def actions_menu
<<EOS
Would you like to?
1. Edit
2. Delete
3. Exit
EOS
end

