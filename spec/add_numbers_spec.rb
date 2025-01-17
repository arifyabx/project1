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

  context "when input contains non-numeric characters" do
    it "raises ArgumentError for alphabetic characters" do
      expect { add_numbers("1,a,3") }.to raise_error(ArgumentError, "Input contains non-numeric characters")
    end

    it "raises ArgumentError for alphanumeric characters" do
      expect { add_numbers("1,bcd,3") }.to raise_error(ArgumentError, "Input contains non-numeric characters")
    end

    it "raises ArgumentError for special characters" do
      expect { add_numbers("1,$,3") }.to raise_error(ArgumentError, "Input contains non-numeric characters")
    end
  end

  context "when input contains custom delimiter" do
    it "returns the correct sum with semicolon delimiter" do
      expect(add_numbers("//;\n1;2;3")).to eq(6)
    end

    it "returns the correct sum with pipe delimiter" do
      expect(add_numbers("//|\n4|5|6")).to eq(15)
    end

    it "handles input with negative numbers and returns them" do
      expect(add_numbers("//;\n-1;2;-3")).to eq("-1,-3")
    end
  end
end
