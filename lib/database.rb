require 'sqlite3'

class Database

  def self.load_structure
    Database.execute <<-SQL
    CREATE TABLE IF NOT EXISTS quotes (
      id integer PRIMARY KEY AUTOINCREMENT,
      name varchar(600) NOT NULL,
      quote_type_id integer,
      author_id integer,
      FOREIGN KEY (quote_type_id) REFERENCES quote_types (id),
      FOREIGN KEY (author_id) REFERENCES authors (id)
    );
    SQL
    Database.execute <<-SQL
    CREATE TABLE IF NOT EXISTS authors (
      id integer PRIMARY KEY AUTOINCREMENT,
      name varchar(200) NOT NULL
    );
    SQL
    Database.execute <<-SQL
    CREATE TABLE IF NOT EXISTS quote_types (
      id integer PRIMARY KEY AUTOINCREMENT,
      type varchar(200) NOT NULL
    );
    SQL
  end

  def self.execute(*args)
    initialize_database unless defined?(@@db)
    @@db.execute(*args)
  end

  def self.initialize_database
    environment = ENV["TEST"] ? "test" : "production"
    database = "db/inspirationals_#{environment}.sqlite"
    @@db = SQLite3::Database.new(database)
    @@db.results_as_hash = true
  end
end
