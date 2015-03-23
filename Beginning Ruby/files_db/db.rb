# DATABASES

# Simplest form = CSV (Comma Separated Values)


# CSV
# Library pretvara csv text u []
# inspect pokazuje da je entry sada u array formi
# Rezultat: ["Fred Bloggs", "Manager", "Male", "45"]
# person = prvi unos u txt/csv (Fred Bloggs)
require 'csv'
CSV.open('text.txt', 'r').each do |person|
  puts person.inspect
end

# Varijacija sa File class
# Rezultat: Fred Bloggs ...
# .parse = uzima string i pretvara ga u CSV u ovom slucaju
require 'csv'
people = CSV.parse(File.read('text.txt'))
puts people[0][1]
puts people[1][0]
puts people[2][0]

# Najprostija varijanta
puts CSV.read('text.txt').inspect

# Find, Find_all
# Ide red po red i pronalazi
# ["Fred Bloggs", "Manager", "Male", "45"]
# p[3] = 45
# to_i.between?() nalazi samo onde stavke u CSV koje imaju vrednost
# izmedju 20,40
young_people = people.find_all do |p|
	p[3].to_i.between?(20,40)
end
puts young_people.inspect


# WRITE CSV
# =~  > za regex
# Otvara fajl, trazi stavku koju zelimo da promenimo
# i upisuje novu vrednost za zeljenu stavku laura[0]
require 'csv'
people = CSV.read('text.txt')
laura = people.find { |person| person[0] =~ /Laura/ }
laura[0] = "Lauren Smith"

# Otvara fajl i ponovo upusuje sve stavke ukljucujuci i promenjenu (laura)
# Upisivanje se vrsi red po red
CSV.open('text.txt', 'w') do |csv|
	people.each do |person|
		csv << person
	end
end



# PSTORE
# Mocnija alternativa za CSV
# Omogucava pristup podacima u OOP maniru

# TEST DATA
class Person
	attr_accessor :name, :job, :gender, :age
end

fred = Person.new
fred.name = "Fred Bloggs"
fred.age = 45

laura = Person.new
laura.name = "Laura Smith"
laura.age = 23

# PSTORE PRIMER
require 'pstore'
store = PStore.new("storagefile")
store.transaction do
	store[:people] ||= Array.new
	store[:people] << fred
	store[:people] << laura
end


# PSTORE Varijanta 2
# ovde se ucitava rezultat iz "storagefile"(gornji primer)
# Prebacuje se sav sadrzaj PSTORE u people[] 
# Nakon toga u people podacima pristupamo kao da je u pitanju objekat
require 'pstore'
store = PStore.new("storagefile")
people = []
store.transaction do
	people = store[:people]
end
people.each do |person|
	puts person.name
end


# YAML
# Human readable format
class Person
	attr_accessor :name, :job, :gender, :age
end

fred = Person.new
fred.name = "Fred Bloggs"
fred.age = 45

laura = Person.new
laura.name = "Laura Smith"
laura.age = 23

require 'yaml'
test_data = [ fred, laura ]
puts YAML::dump(test_data) # dump konvertuje podatke u YAML

# YAML Varijacija 2
# yaml_string (sa heredoc)
# Prikazuje kako izgleda sadrzaj Yaml fajla
# !ruby/object... = YAML moze da snima i kao array npr ili drugi ruby datatype
yaml_string = <<END_OF_DATA
---
- !ruby/object:Person
age: 45
name: Jimmy
- !ruby/object:Person
age: 23
name: Laura Smith
END_OF_DATA

test_data = YAML::load(yaml_string) # load konvertuje YAML u podaci array
puts test_data[0].name
puts test_data[1].name

	
