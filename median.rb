# Return the median value in |items|.  |items| is unsorted.
def median(items)
  nth_sorted_item(items, items.length / 2)
end

# Return the |n|th 0-based item in |items| if |items| were sorted.  Do not
# modify |items|.
def nth_sorted_item(items, n)
  return items[0] if items.length == 1 # base case

  # We pivot on the halfway point between min and max.  We could also choose a
  # random pivot which, heck, probably works better on pathological
  # distributions.
  pivot = (items.min + items.max) / 2
  left, right = items.partition { |x| x <= pivot }

  #puts "n=#{n}\titems: #{items}\tleft: #{left},\tright:#{right}"
  its_on_the_left_mate = (left.length > n)
  n -= left.length unless its_on_the_left_mate
  nth_sorted_item(its_on_the_left_mate ? left : right, n)
end

puts median(Array(0..ARGV[0].to_i).shuffle)
