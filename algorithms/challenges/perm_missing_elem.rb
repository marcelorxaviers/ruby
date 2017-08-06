puts """
PermMissingElem: https://codility.com/demo/results/training9JABDZ-Y3C/


A zero-indexed array A consisting of N different integers is given. The array contains integers in the range [1..(N + 1)], which means that exactly one element is missing.

Your goal is to find that missing element.

Write a function:

def solution(a)

that, given a zero-indexed array A, returns the value of the missing element.

For example, given array A such that:

  A[0] = 2
  A[1] = 3
  A[2] = 1
  A[3] = 5
the function should return 4, as it is the missing element.

Assume that:

N is an integer within the range [0..100,000];
the elements of A are all distinct;
each element of array A is an integer within the range [1..(N + 1)].
Complexity:

expected worst-case time complexity is O(N);
expected worst-case space complexity is O(1), beyond input storage (not counting the storage required for input arguments).
Elements of input arrays can be modified.


Press enter to continue...
"""
gets
puts """
def solution(a)
  return 1 if a.empty?
  max = a[0]
  sum = 0
  a.each do |e|
    max = e if e > max
    sum += e
  end
  missing = ((max * (max + 1)) / 2) - sum
  missing.zero? ? max + 1 : missing
end


puts solution [2, 3, 1, 5]
"""

def solution(a)
  return 1 if a.empty?
  max = a[0]
  sum = 0
  a.each do |e|
    max = e if e > max
    sum += e
  end
  missing = ((max * (max + 1)) / 2) - sum
  missing.zero? ? max + 1 : missing
end

puts "Result => #{solution [2, 3, 1, 5]}"