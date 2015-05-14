class Quote
  attr_reader :id, :errors
  attr_accessor :name

  def initialize(name = nil)
    self.name = name 
  end

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
 
  def valid?
    if name.nil? or name.empty? or /^\d+$/.match(name)
      @errors = "\"#{name}\" is not a valid quote."
      false
    else
     @errors = nil
     true
    end
  end

  def save
    return false unless valid?
    Database.execute("INSERT INTO quotes (name) VALUES (?)", name)
    @id = Database.execute("SELECT last_insert_rowid()")[0]['last_insert_rowid()']
  end


  #def self.create(name)
    #return if /^\d+$/.match(name)
    #if name.empty?
      #raise ArgumentError.new
    #else
      #Database.execute("INSERT INTO quotes (name) VALUES (?)", name)
    #end
end
