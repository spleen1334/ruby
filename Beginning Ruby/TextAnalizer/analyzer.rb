# TEXT ANALIZER APP
# FROM: Beginning Ruby


text = ''
line_count = 0

# File.open("text.txt").each { |line| puts line }

# File.open("text.txt").each { |line| line_count += 1 }
# puts line_count

# File.open("text.txt").each do |line|
#   line_count += 1
#   text << line
# end

# lines = File.readlines("text.txt") # hardcoded file
lines = File.readlines(ARGV[0]) # prihvati cli parametar za ime fajla
line_count = lines.size
text = lines.join

puts "#{line_count} lines"


total_characters = text.length
puts "#{total_characters} characters"


total_characters_no_spaces = text.gsub(/\s+/, '').length
puts "#{total_characters_no_spaces} characters excluding spaces"


# RAZLIKA IZMEDJU SCAN - SPLIT
# text = "First-class decisions require clear-headed thinking."
# puts "Scan method: #{text.scan(/\w+/).length}" = 7 (jer razdvaja - u dve reci)
# puts "Split method: #{text.split.length}"      = 5

word_count = text.split.length
puts "#{word_count} words"


# Regex
# . i ? > moraju da budu esc
# ! nemora jer se ne koristi u regex
# | je nesto kao OR u regex
sentence_count = text.split(/\.|\?|!/).length
puts "#{sentence_count} sentences"

# Svaki paragraph je odvojen sa dva nova reda (\n)
paragraph_count = text.split(/\n\n/).length
puts "#{paragraph_count} paragraphs"


# STATISTIKA

# Ovo su sve INT vrednosti tako da je rezultat uvek prikazan kao ceo broj
puts "#{sentence_count / paragraph_count} sentences per paragraph (avg)"
puts "#{word_count / sentence_count} words per sentence (avg)"


# STOP WORDS
# http://en.wikipedia.org/wiki/Stop_words

# %w array > 'rec'
# stopwords = %w{the a by on for of are with just but and to the my I has some in}


