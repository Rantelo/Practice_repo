def substrings(words, dictionary)
	hash = {}
	dictionary.each do |substring|
		finds = words.downcase.scan(/#{substring.downcase}/).length
		hash[substring] = finds if finds > 0
	end
	hash
end

print "Type the sentence to examine \n> "
words = gets.chomp
#words = "Howdy partner, sit down! How's it going?"
print "Enter the dictionary. Each word must be separated by commas\n> "
dictionary = gets.chomp.split(",").map(&:strip)
#dictionary = ["below", "down", "go", "going", "horn", "how", "howdy", "it", "i", "low", "own", "part", "partner", "sit"] 

puts substrings( words, dictionary )