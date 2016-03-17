def binary_search(a, v, f = 0, t = (a.size - 1))
  m = (f + t) / 2
  return binary_search(a, v, f, m - 1) if v < a[m]
  return binary_search(a, v, m + 1, t) if v > a[m]
  m
end

puts binary_search([5, 6, 7, 8, 9, 10, 11, 12, 13, 14], 10)
