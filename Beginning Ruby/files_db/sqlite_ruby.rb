# SQLITE RUBY
# mora da se instalira kao gem (gem install sqlite3-ruby)
# result_as_hash = vraca rezultat kao hash a ne kao array
# $db = global var
# execute = method za izvrsavanje SQL

# Connect to DB
require 'rubygems'
require 'sqlite3'
$db = SQLite3::Database.new("dbfile")
$db.results_as_hash = true

# Disconnect from DB
def disconnect_and_quit
	$db.close
	puts "DB connection closed."
	exit # ujedno izlazi iz programa
end

# SQL  
# CREATE TABLE
# %Q = NONINTERPOLATED STRING DELIMETER
def create_table
	puts "Creating people table"
	$db.execute %q{
		CREATE TABLE people (
			id integer primary key
			name varchar(60)
			job varchar(60)
			gender varchar(6)
			age integer)
	}
end

# INSERT
# Dodaj novi row u DB
# chomp = remove \n (ima jos primena)
def add_person
	puts "Enter name:"
	name = gets.chomp
	puts "Enter job:"
	job = gets.chomp
	puts "Enter gender:"
	gender = gets.chomp
	puts "Enter age:"
	age = gets.chomp

	# ? - automatska substitucija sa vars
	# To se radi radi zastite od nezeljenih INJECTIONS
	# ? je placeholdre koji automatski cisti prosledjene podatke 
	# i formatira ih u odgovarajuci format
	$db.execute("INSERT INTO people (name, job, gender, age) VALUES (?, ?, ?, ?)", 
	name, job, gender, age)
end

# SELECT
# Pretraga
def find_person
	puts "Enter name or ID of person to find:"
	id = gets.chomp

	person = $db.execute("SELECT * FROM people WHERE name = ? OR id = ?", id, id.to_i).first

	unless person
		puts "No results found"
		return	
	end

	puts %Q{Name: #{person['name']}
			Job: #{person['job']}
			Gender: #{person['gender']}
			Age: #{person['age']}}
		end


# PETLJA ZA PROGRAM
# loop do ... end > Endless petlja koja mora da se breakuje
# Posebna vrsta petlje koja se koristi kada neznamo koliko iteracija ce biti izvrseno
# while( true ) = ekvivalentna stvar (to generise neku vrstu beskonance petlje, 
#	koju sami prekidamo)
loop do
	puts %q{Please select an option:

	1. Create people table
	2. Add a person
	3. Look for a person
	4. Quit}

	case gets.chomp
	when '1'
		create_table
	when '2'
		add_person
	when '3'
		find_person
	when '4'
		disconnect_and_quit
	end
end
