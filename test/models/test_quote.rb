require_relative '../test_helper'

describe Quote do
  describe "#all" do
    describe "if there are no quotes in the database" do
      it "should return an empty array" do
        assert_equal [], Quote.all
      end
    end
    describe "if there are quotes" do
      before do
        create_quote("Apple")
        create_quote("Dog")
        create_quote("Cat")
      end
      it "should return an array" do
        assert_equal Array, Quote.all.class
      end
      it "should return the quotes in alphabetical order" do
        expected = ["Apple", "Cat", "Dog"]
        actual = Quote.all.map{ |quote| quote.name }
        assert_equal expected, actual
      end
    end
  end

  describe "#count" do
    describe "if there are no quotes in the database" do
      it "should return 0" do
        assert_equal 0, Quote.count
      end
    end
  describe "if there are quotes" do
    before do
      create_quote("Apple")
      create_quote("Dog")
      create_quote("Cat")
    end
    it "should return the correct count" do
      assert_equal 3, Quote.count
    end
   end
  end

  #describe "#create" do
    #describe "if we need to add quotes" do
      #it "should add a quote" do
        #Quote.create("Best or none.")
        #assert_equal 1, Quote.count
      #end

      #it "should reject empty strings" do
        #assert_raises(ArgumentError) { Quote.create("") }
      #end
    #end
  #end

  describe ".initialize" do
    it "sets the name attribute" do
      quote = Quote.new("foo")
      assert_equal "foo", quote.name
    end
  end

  describe ".save" do
    describe "if the model is valid" do
      let(:quote){ Quote.new("Hello Kitty")}
      it "should return true" do
        assert quote.save
      end
      it "should save the model to the database" do
        quote.save
        last_row = Database.execute("SELECT * FROM quotes")[0]
        database_name = last_row['name']
        assert_equal "Hello Kitty", database_name
      end
      it "should populate the model with id from the database" do 
        quote.save
        last_row = Database.execute("SELECT * FROM quotes")[0]
        database_id = last_row['id']
        assert_equal database_id, quote.id
      end
   end

   describe "if the model is invalid" do
     let(:quote){Quote.new("")}
     it "should return false" do 
       refute quote.save
     end
     it "should not save the model to the database" do
       quote.save
       assert_equal 0, Quote.count
     end
     it "should populate the error messages" do
       quote.save
       assert_equal "\"\" is not a valid quote.", quote.errors
     end
    end
  end

   describe ".valid?" do
     describe "with valid data" do
       let(:quote){ Quote.new("kitties are great")}
       it "returns true" do
         assert quote.valid?
       end
       it "should set errors to nil" do
         quote.valid?
         assert quote.errors.nil?
       end
     end
     describe "with no name" do
       let(:quote){ Quote.new(nil)}
       it "returns false" do
         refute quote.valid?
       end
       it "sets the error message" do
         quote.valid?
       assert_equal "\"\" is not a valid quote.", quote.errors
       end
     end
    describe "with empty name" do
      let(:quote){ Quote.new("")}
      it "returns false" do 
        refute quote.valid?
      end
       it "sets the error message" do
         quote.valid?
       assert_equal "\"\" is not a valid quote.", quote.errors
       end
    end
    describe "with a name with no letter characters" do
      let(:quote){ Quote.new("777") }
      it "returns false" do
        refute quote.valid?
      end
      it "sets the error message" do
        quote.valid?
        assert_equal "\"777\" is not a valid quote.", quote.errors
      end
    end
    describe "with a previously invalid name" do
      let(:quote){ Quote.new("666") }
      before do
        refute quote.valid?
        quote.name = "Eat a pop tart"
        assert_equal "Eat a pop tart", quote.name
      end
      it "should return true" do
        assert quote.valid?
      end
      it "should not have an error message" do
        quote.valid?
        assert_nil quote.errors
      end
    end
  end
end
