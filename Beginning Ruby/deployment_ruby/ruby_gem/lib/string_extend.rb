# Klasa za gem
class String
	def vowels
		scan(/[aeiou]/i)
	end
end

# "This is a test".vowels >> i, i, a, e