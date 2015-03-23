# ARGV
# specijaln [] koji ucitava sve parametre iz cli
# npr ruby argv.rb test123 > ARGV = test123

# Spaja sve argumente sa - i print
puts ARGV.join('-')

# Test prikaza
puts ARGV[0]
# prvi clan niza
# primer ruby argv.rb test.txt asdf
# ovo ce selektovati samo test.txt
