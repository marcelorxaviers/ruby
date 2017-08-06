puts """
Given two given numbers a and b where 1<=a<=b, find the number of perfect squares between a and b (a and b inclusive).

Examples

Input :  a = 3, b = 8
Output : 1
The only perfect in given range is 4.

Input : a = 9, b = 25
Output : 3
The three squares in given range are 9, 16 and 25

Input : a = 25, b = 100
Output : 6
The three squares in given range are 25, 36, 49, 64, 81 and 100

puts solution(3, 8) => 1
puts solution(9, 25) => 3
puts solution(25, 100) => 6
"""

def solution(a, b)
  max = Math.sqrt(b).ceil
  perfects = max - Math.sqrt(a).ceil
  b >= (max * max) ? perfects + 1 : perfects
end

puts "Result => #{solution(3, 8)}"
puts "Result => #{solution(9, 25)}"
puts "Result => #{solution(25, 100)}"