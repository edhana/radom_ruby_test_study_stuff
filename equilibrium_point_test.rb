require 'minitest/autorun'

def solution(a)
  res = []
  size = a.size-1
  p = 1 

  (p..size).each do |t|
    esq = 0 #left
    dir = 0 #right

    esqf = t-1
    diri = t+1

    a[0..(esqf)].each{|n| esq += n}

    if diri <= size
      a[(diri)..(size)].each{|n| dir += n}
    else
      dir = a[size]
    end

    if esq == dir
      res << p
    end
  end

  if res.size == 0
   return -1
  end

  return res.sample
end

describe "I need to find the freaking solution" do
  it "should pass the basic case" do
    arr_test = [-1, 3, -4, 5, 1, -6, 2, 1]
    res = solution(arr_test)
    assert_equal true, (res == 3 or res == 1 or res == 7)
  end

  it "should pass the second basic case" do
    arr_test = [0,10]
    assert_equal -1, solution(arr_test)
  end

  it "should use oncredible huge numbers" do
    arr_test = *((1082132608-10000)..(1082132608))
    tinit = Time.now
    puts "===>> Array created, now, processing it #{tinit}"
    assert_equal -1, solution(arr_test)
    puts "===>> Processed #{Time.now - tinit}"
  end
end


#
# This is a demo task.

#A zero-indexed array A consisting of N integers is given. An equilibrium index of this array is any integer P such that 0 ≤ P < N and the sum of elements of lower indices is equal to the sum of elements of higher indices, i.e. 
#A[0] + A[1] + ... + A[P−1] = A[P+1] + ... + A[N−2] + A[N−1].
#Sum of zero elements is assumed to be equal to 0. This can happen if P = 0 or if P = N−1.

#For example, consider the following array A consisting of N = 8 elements:

  #A[0] = -1
  #A[1] =  3
  #A[2] = -4
  #A[3] =  5
  #A[4] =  1
  #A[5] = -6
  #A[6] =  2
  #A[7] =  1
#P = 1 is an equilibrium index of this array, because:

#A[0] = −1 = A[2] + A[3] + A[4] + A[5] + A[6] + A[7]
#P = 3 is an equilibrium index of this array, because:

#A[0] + A[1] + A[2] = −2 = A[4] + A[5] + A[6] + A[7]
#P = 7 is also an equilibrium index, because:

#A[0] + A[1] + A[2] + A[3] + A[4] + A[5] + A[6] = 0
#and there are no elements with indices greater than 7.

#P = 8 is not an equilibrium index, because it does not fulfill the condition 0 ≤ P < N.

#Write a function:

#def solution(a)

#that, given a zero-indexed array A consisting of N integers, returns any of its equilibrium indices. The function should return −1 if no equilibrium index exists.

#For example, given array A shown above, the function may return 1, 3 or 7, as explained above.

#Assume that:

#N is an integer within the range [0..100,000];
#each element of array A is an integer within the range [−2,147,483,648..2,147,483,647].
#Complexity:

#expected worst-case time complexity is O(N);
#expected worst-case space complexity is O(N), beyond input storage (not counting the storage required for input arguments).
#Elements of input arrays can be modified.
