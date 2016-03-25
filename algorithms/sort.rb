def merge(l, a1, a2)
  i, j = 0, 0
  merged = []
  0.upto(l).each do |k|
    if !a1[i].nil? && a1[i] <= (a2[j] || a1[i])
      merged << a1[i]
      i = i.next
    else
      merged << a2[j]
      j = j.next
    end
  end
  return merged
end

def merge_sort(a)
  s = a.size
  return a if s == 1
  return a[0] < a[1] ? a : [a[1], a[0]] if s == 2 
  a1 = merge_sort(a[0...(s/2)])
  a2 = merge_sort(a[(s/2)..-1])
  merge(s - 1, a1, a2)
end

def bubble_sort(array)
  n = array.length
  loop do
    swapped = false

    (n-1).times do |i|
      if array[i] > array[i+1]
        array[i], array[i+1] = array[i+1], array[i]
        swapped = true
      end
    end

    break if not swapped
  end

  array
end

expected = 1.upto(10000).to_a
unsorted = 10000.downto(1).to_a

b = Time.now
bubble_sorted = bubble_sort(unsorted)
puts "Bubble sort took #{Time.now - b}s and it is #{bubble_sorted == expected} that the array is sorted"

b = Time.now
merge_sorted = merge_sort(unsorted)
puts "Merge sort took #{Time.now - b}s and it is #{merge_sorted == expected} that the array is sorted"
