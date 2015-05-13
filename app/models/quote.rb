class Quote
  attr_accessor :name

  def self.all
    Database.execute("select name from quotes order by name ASC").map do |row|
      quote = Quote.new
      quote.name = row[0]
      quote
    end
  end

  def self.count
    Database.execute("select count(id) from quotes")[0][0]
  end

  def self.create(name)
    if name.empty?
      raise ArgumentError.new
    else
      Database.execute("INSERT INTO quotes (name) VALUES (?)", name)
    end
  end
end
