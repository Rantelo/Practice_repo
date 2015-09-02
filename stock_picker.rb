# NOTE: Naive approach is order O(n^2)
def stock_picker_naive_approach prizes
	purch_day, sell_day, best_diff = 0, 0, 0
	(0...prizes.size).each do |i|
		((i+1)...prizes.size).each do |j|
			if prizes[j] - prizes[i] > best_diff 
				best_diff = prizes[j] - prizes[i] 
				purch_day, sell_day = i, j
			end
		end
	end
	[purch_day, sell_day]
end

# NOTE: Instead, this approach is O(n)
def stock_picker prizes
	purch_day, sell_day = 0, 1
	best_diff  = prizes[sell_day] - prizes[purch_day]
	lowest_day = prizes[purch_day] < prizes[sell_day] ? purch_day : sell_day

	(2...prizes.size).each do |i|
		# 1. Is better to sell on 'i' than the current sell_day?
		if best_diff <= prizes[i] - prizes[purch_day]
			temp		 = sell_day
			sell_day = i
			# 2. Is it better to buy on the current sell_day and sell on 'i'
			#    instead of what we already have?
			purch_day = temp if prizes[i] - prizes[purch_day] <= prizes[i] - prizes[temp]
			best_diff = prizes[sell_day] - prizes[purch_day]
		end
		
		# 3. We already know the buy/sell days. Is that combination better than
		#    buying on the day that the stock is the lowest and sell on the sell_day?
		if (best_diff < prizes[sell_day] - prizes[lowest_day]) &&
			 (lowest_day < sell_day)
			purch_day = lowest_day
			best_diff = prizes[sell_day] - prizes[purch_day]
		end

		# 4. Which is the day that the stock is the lowest?
		lowest_day = i if prizes[i] < prizes[lowest_day]
	end
	[purch_day,sell_day]
end

buy, sell = stock_picker [17,3,6,9,15,8,6,1,10]
puts "[#{buy},#{sell}]"
