def caesar_cipher str, num
	ary = str.split("")
	ary.map!{|c|
		if c.ord.between?(97,122)
			if c.ord + num < 97
				(c.ord + num + 26).chr 
			elsif c.ord + num > 122
				(c.ord + num -26).chr
			else
				(c.ord + num).chr
			end
		elsif c == ' '
			c = ' '
		else
			c
		end
	}
	ary.join
end
# TODO: add Uppercase Support 

puts cipher "What a string!", 5
puts cipher "khb, vl ph yhq", -3
