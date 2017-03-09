require 'minitest/autorun'

# Problem description
# A binary gap within a positive integer N is any maximal sequence of consecutive zeros that is surrounded by ones at both ends in the binary representation of N.

#For example, number 9 has binary representation 1001 and contains a binary gap of length 2. The number 529 has binary representation 1000010001 and contains two binary gaps: one of length 4 and one of length 3. The number 20 has binary representation 10100 and contains one binary gap of length 1. The number 15 has binary representation 1111 and has no binary gaps.

#Write a function:

#def solution(n)

#that, given a positive integer N, returns the length of its longest binary gap. The function should return 0 if N doesn't contain a binary gap.

#For example, given N = 1041 the function should return 5, because N has binary representation 10000010001 and so its longest binary gap is of length 5.

#Assume that:

#N is an integer within the range [1..2,147,483,647].
#Complexity:

#expected worst-case time complexity is O(log(N));
#expected worst-case space complexity is O(1).


# you can write to stdout for debugging purposes, e.g.
# puts "this is a debug message"

def solution(n)
  # write your code in Ruby 2.2
  bin_str = n.to_s(2)
  max_gap = 0
  tmp_gap = 0
  trailing = false
  
  bin_str.each_char do |bit|
    if bit == '0'
      tmp_gap += 1
      trailing = true
    else
      if trailing and tmp_gap > max_gap 
        max_gap = tmp_gap
        trainling = false
      end
      tmp_gap = 0
    end
  end

  return max_gap
end

describe "Binary gap exercise" do
  it "should calculate the binary gap of simple numbers" do
    assert_equal 5, solution(1041)
    assert_equal 0, solution(15)
    assert_equal 0, solution(1)
    assert_equal 1, solution(5)
    assert_equal 0, solution(2**31-1)
  end

  it "shoudl find trailing zeroes" do
    assert_equal 0, solution(6)
    assert_equal 2, solution(328)
    assert_equal 2, solution(51712)
    assert_equal 1, solution(20)
  end
end
