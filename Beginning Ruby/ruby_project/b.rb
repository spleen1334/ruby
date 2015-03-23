# Ovde se pokusava objasniti razlika izmedju REQUIRE i LOAD
# load = ucitava ceo fajl svaki put
# require = ucitava samo 1 file
# BUG: require zahteva $LOAD_PATH ili mora da se navede explicitno path sa ./

require './a.rb'
puts "Hello from b.rb"

require './a.rb'
puts "Hello again from b.rb"

# da je umesto require stajao load
# rezultat bi bio:
# Hello from a.rb
# Hello from br.b
# Hello from a.rb
# Hello again from b.rb


# $LOAD_PATH ili $: = ruby
# videti sadrzaj $: >> irb: $:.each { |d| puts d }
# dodati nove linkove u path >> $:.push '/your/direcotry'
