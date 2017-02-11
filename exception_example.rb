require "minitest/autorun"

class Calc
  def do_calc( num )
    begin
      result = 100 / num.to_i
    rescue Exception => e
      result = 0
      msg = "Error: #{e.to_s}"
    else
      msg = "Result = #{result}"
    ensure
      msg = "You entered '#{num}'. " + msg
    end

    return msg
  end
end

describe Calc do
  before do
    @calc = Calc.new
  end

  describe "when testing for a new way to handle Exceptions" do
    it "must do all the calculations right" do
      # @calc.do_calc(123).must_be_nil
      @calc.do_calc(123).must_equal "You entered \'123\'. Result = 0"
    end
  end
end

# old execise -- previous to the test
# print("Enter a number: ")
# a_num = gets().chomp()
# puts(do_calc(a_num))
