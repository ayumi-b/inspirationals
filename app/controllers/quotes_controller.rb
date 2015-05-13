require 'highline/import'

class QuotesController
  def index
    if Quote.count > 0
      quotes = Quote.all
      quotes_string = ""
      quotes.each_with_index do |quote, index|
        quotes_string << "#{index + 1}. #{quote.name}\n"
      end
      quotes_string
    else
      "there are no quotes found. Add a quote.\n"
    end
  end

  def add(name)
    name_cleaned = name.strip
    unless /^\d+$/.match(name_cleaned)
      Quote.create(name_cleaned)
      name_cleaned
    end
  end
end
