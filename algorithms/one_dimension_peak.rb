
def greater?(actual, previous, nexxt)
  actual >= previous && actual >= nexxt
end

def on(a, from = 0, to = a.size - 1)
  a.first if a.size < 2
  from.upto(to) do |i|
    return a[i] if greater?(a[i], (a[i - 1] || a[i]), (a[i + 1] || a[i]))
  end
end

def logn2(a)
  a.first if a.size < 2
  i = a.size/2
  return logn2(a[0..(i - 1)]) if a[i] < (a[i - 1] || a[i])
  return logn2(a[(i + 1)..-1]) if a[i] < (a[i + 1] || a[i])
  a[i]
end

a = 1.upto(10000000).to_a
b = Time.now
on(a)
p Time.now - b

b = Time.now
logn2(a)
p Time.now - b