# STOP WORDS
# http://en.wikipedia.org/wiki/Stop_words

# %w array > 'rec'
stopwords = %w{the a by on for of are with just but and to the my I has some in}

# TEST Primer
sw_txt = %q{Los Angeles has some of the nicest weather in the country.}
sw_words = sw_txt.scan(/\w+/)
sw_keywords = sw_words.select { |word| !stopwords.include?(word) } # word koji nije sadrzan u stopwords[]
puts sw_keywords.join(' ')

# to_f = float, to_i = int
puts "Useful word %#{((sw_keywords.length.to_f / sw_words.length.to_f) * 100).to_i}"
