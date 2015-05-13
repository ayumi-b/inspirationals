require_relative '../test_helper'

describe QuotesController do

  describe ".index" do
    let(:controller) {QuotesController.new}
    
    it "should say no quotes found when empty" do
      actual_output = controller.index
      expected_output = "there are no quotes found. Add a quote.\n"
      assert_equal expected_output, actual_output
    end
  end

  describe ".add" do
    let(:controller) {QuotesController.new}

    it "should add a quote to database" do
      controller.add("feline power")
      assert_equal 1, Quote.count
    end

    it "should not add quote all spaces" do
      quote_name = "        "
      assert_raises(ArgumentError){ controller.add(quote_name) }
    end

    it "should only add quotes that make sense" do
      quote_name = "111111111111"
      controller.add(quote_name)
      assert_equal 0, Quote.count
    end
  end
end
