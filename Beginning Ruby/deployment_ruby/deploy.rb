# TEHNIKE DEPLOYMENTA

# Interpreter
ruby test.rb

# Shebang (unix)

#!/usr/bin/ruby
puts "Your program!"

# Gornja opcija radi samo ako je ruby na podesenoj lokaciji
# enviroment >> omogucava da se automatski ucita ruby iz trenutnog
# radnog okruzenja bez obzira gde je instaliran

#!/usr/bin/env ruby
puts "Your program!!"

# Neophodno je i chmod +x test.rb
# Cak je moguce i ukloniti sufix: test


# RUBY_PLATFORM
# Detekcija ruby runtime enviroment
if RUBY_PLATFORM =~ /win32/
	puts "We're in Windows!"
elsif RUBY_PLATFORM =~ /linux/
	puts "We're in Linux!"
elsif RUBY_PLATFORM =~ /darwin/
	puts "We're in Mac OS X!"
elsif RUBY_PLATFORM =~ /freebsd/
	puts "We're in FreeBSD!"
else
	puts "We're running under an unknown operating system."
end

# ENV 
# Poseban hash gde se skladisti dosta informacija o enviromentu
# Moze da se pokrene i u irb
ENV.each {|e| puts e.join(': ') }

# Primena ENV
# Npr utvrdi koji je sys, pa onda na osnovu toga 
# podesi tmp_dir
tmp_dir = '/tmp'
if ENV['OS'] =~ /Windows_NT/
	puts "This program is running under Windows NT/2000/XP!"
	tmp_dir = ENV['TMP']
elsif ENV['PATH'] =~ /\/usr/
	puts "This program has access to a UNIX-style file system!"
else
	puts "I cannot figure out what environment I'm running in!"
	exit
end


# ARGV
# je array koji sadrzi parametre passovane is shella
ruby test.rb ovo su paramteri
# ARGV = ["ovo", "su", "parametri"]
# ARGV[0] = "ovo", ARGV[1] = "su", itd...	
