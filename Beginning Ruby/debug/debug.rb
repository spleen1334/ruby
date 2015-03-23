# EXCEPTIONS & ERROR HANDLING
#
# An exception is an event that occurs when an error arises within a program.
# U ruby postoji EXCEPTION klasa. (ona u sebi sadrzi jos 30ak podklasa, koje se
# i pozivaju)
# Ona automatski raise exceptione, ili je moguce kontrolisati to ponasanje
# u nasem kodu, nasledjivanjem.


class Person
  def initialize(name)
    raise ArgumentError, "No name present" if name.empty?
  end
end

fred = Person.new('')

### CUSTOM Exception
class BadDataException < RuntimeError; end

class Box
  def initialize(width)
    raise BadDataException, "No length added" if width.empty?
  end
end

cube = Box.new('')

# EXCEPTION HANDLING
#
# Koristi se begin/end block, i rescue
# Exceptioni generalno zaustavljaju izvrsenje programa,
# uz pomoc error handliga se execution ipak nastavlja.
# Narucito su korisni kada je neophodno izvrsiti proveru external data.

begin
  puts 10 / 0
rescue
  puts "You caused an error!"
end

# EXTERNAL DATA
# Ovo je korisno jer ukoliko nema interneta ili je nemoguce pristupiti
# zeljenoj strani, program ipak nastavalja sa nekim podacima iz rescue
data = ""
begin
  # <..code to retrieve the contents of a Web page..>
  # data = <..content of Web page..>
rescue
  puts "The Web page could not be loaded! Using default data instead."
  # data = <..load data from local file..>
end
puts data


# RESCUE BLOCKOVI
# Ovde mogu da idu pozivi iz RAISE
begin
  # ... code here ...
rescue ZeroDivisionError
  # ... code to rescue the zero division exception here ...
rescue YourOwnException
  # ... code to rescue a different type of exception here ...
rescue
  # ... code that rescues all other types of exception here ...
end


# PASSED EXCEPTIONS
# Samo dodatni parametar kome je moguce pristupiti slicno sa js
begin
  puts 10 / 0
rescue => e  # e = exception objekat, on moze da sadrzi argumente itd..
  puts e.class
end


# CATCH & THROW
#
# Rade iskljucivo sa symbols. Koriste se kada je neophodno brzo
# izaci iz petlje, nested calla, methode ...
#
# Vise se koristi za neke provere:
# Sometimes you want to be able to break out of a thread of execution (say,
# a loop) during normal operation in a similar way to an exception, but without
# actually generating an error.

catch(:finish) do
  1000.times do
    x = rand(1000)
    throw :finish if x == 123
  end

  puts "Generated 1000 random numbers WITHOUT 123"
end

# Catch i throw NE moraju da budu u istom SCOPE
# Isti kod kao gore, rewroten
def generate_random_number_except_123
  x = rand(1000)
  throw :finish if x == 123
end

catch(:finish) do
  1000.times { generate_random_number_except_123  }
  puts "Generated 1000 random numbers without generating 123!"
end


