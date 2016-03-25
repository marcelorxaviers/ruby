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

p merge_sort(1000000.downto(1).to_a)[0..9]
