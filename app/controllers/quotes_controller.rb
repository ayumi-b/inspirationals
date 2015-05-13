class QuotesController
  def index
    if Quote.count > 0
      quotes = Quote.all
      quotes.each_with_index do |quote, index|
        say("#{index + 1}. #{quote.name}")
      end
    else
      say("No quotes found. Add a quote.\n")
    end
  end
end
