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
        actual = Quote.all.map { |quote| quote.name }
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

  describe "#create" do
    describe "if we need to add quotes" do
      it "should add a quote" do
        Quote.create("Best or none.")
        assert_equal 1, Quote.count
      end

      it "should reject empty strings" do
        assert_raises(ArgumentError) { Quote.create("") }
      end
    end
  end


end
