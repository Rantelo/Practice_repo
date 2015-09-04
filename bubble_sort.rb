def bubble_sort ary
  ary.each_with_index do |j,index|
    (1...ary.size-index).each do |i|
      ary[i-1], ary[i] = ary[i], ary[i-1] if ary[i-1] > ary[i]
    end
  end
  ary
end

def bubble_sort_by ary
  ary.each_with_index do |j,index|
    (1...ary.size-index).each do |i|
      ary[i-1], ary[i] = ary[i], ary[i-1] if yield(ary[i-1], ary[i]) > 0
    end
  end
end

ary = [4,3,78,2,0,32]

puts bubble_sort_by(ary){|left, rigth| left-rigth}.join("-") #=> 0-2-3-4-32-78
puts bubble_sort(ary).join("-")                              #=> 0-2-3-4-32-78
