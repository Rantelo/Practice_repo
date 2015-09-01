def helper num
	ans = ""
	ans += "0" if num < 10
	ans += "0" if num < 100
	ans += "#{num}"
	ans
end

def format number
	ans = ""
	while number > 0
		if number >= 1000
			ans = ",#{helper(number % 1000)}#{ans}"
		else
			ans = "#{number % 1000}#{ans}"
		end
		number /= 1000
	end
	ans
end

puts format 1000234104340053543
