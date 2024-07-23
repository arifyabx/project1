require_relative '../add_numbers'  # Adjust the path as per your actual structure

RSpec.describe "add_numbers" do
  context "when input contains numberic character" do
    it "returns the correct sum for basic input with integers" do
      expect(add_numbers("10,20,30,40")).to eq(100)
    end

    it "handles input with negative numbers" do
      expect(add_numbers("-10,-20,30,40")).to eq('-10,-20')
    end

    it "handles input with floats" do
      expect(add_numbers("10.5,20.75,30.5")).to eq(61.75)
    end

    it "handles input with mixed integers and floats" do
      expect(add_numbers("10,20.5,30,45")).to eq(105.5)
    end

    it "ignores leading and trailing whitespaces" do
      expect(add_numbers(" 10 ,  20 ,30,  40 ")).to eq(100)
    end

    it "returns 0 for empty input" do
      expect(add_numbers("")).to eq(0)
    end

    it "handles input with a single number" do
      expect(add_numbers("5")).to eq(5)
    end

    it "handles input with large numbers" do
      expect(add_numbers("1000000,2000000,3000000")).to eq(6000000)
    end

    it "handles input with numbers separated by newline characters" do
      expect(add_numbers("1\n2\n3")).to eq(6)
    end
  end
end
