# I/O Streams
# Osnova svih operacija IO u Ruby

# READLINES
# Najjednostavniji nacin za prikaz fajlova
# Ucitava red po red nekog fajla sve do EOF
# lines = readlines

# Primer
# Otvoriti sa ruby file_open_new.rb < nekitextfajl.txt
puts readlines.length


# FILE.OPEN SHORTHAND
# ovde samo prikazuje sadrzaj fajla
File.open("text.txt").each { |file| puts line }

# FILE.OPEN
# Ubacuje unos usera u text.txt
File.open("text.txt") do |file|
  puts f.gets
end


# FILE.NEW
# "r" = read parametar
f = File.new("text.txt", "r")
puts f.gets
f.close

# Moze i Dir::pwd za path

# RAZLIKA IZMEDJU FILE.OPEN i NEW
# File.open prihvata block i nakon izvrsenja bloka automatski zatvara fajl.
# File.new samo VRACA File objekat koji se odnosi na fajl, da bi se zatvorio
# koristi se close method.


# FILE HANDLING KAO KLASA

class MyFile
  att_reader :handle

  def initialize(filename)
    @handle = File.new(filename, "r")
  end

  def finished
    @handle.close
  end
end

# handle > referenca za File objekat
f = MyFile.new("text.txt")
puts f.handle.gets
f.finished


# FILE OPEN TEHNIKE

# Standard
File.open("text.txt").each { |file| puts line }

# Delimiter, obicno cita fajl do kraja line
# podesvanjem delimiter (razdvajanje) se customizuje akcija
# $/ = ovo je default delimiter varijabla moze da se modifikuje
File.open("text.txt").each(',') { |file| puts line }

# Cita fajl byte po byte
File.open("text.txt").each_byte { |byte| puts byte }

# Cita char po char (slovo)
File.open("text.txt").each_char { |char| puts char }

# Gets ?
# on nije iterator pa zato mora da se naglasi koliko puta
# da se pozovo komanda
File.open("text.txt") do |g|
  2.times { puts g.gets }
end


# Array
puts File.open("text.txt").readlines.join("--")

# Ucitavati odredjen broj byte READ
# ucita samo prvih 6 char
File.open("text.txt") do |r|
  puts r.read(6)
end

# Shorthand Read
# Isto sto i:
# File.open(filename).read i na kraju zatvara fajl
data = File.read(filename)


# POZICIJA U OKVIRU FAJLA
# .pos method daje poziciju
# Ovo otvara fajl
# pos = 0
# gets ucitava prvu liniju npr "spleen"
# pos = 7
fff = File.open("text.txt")
puts fff.pos
puts fff.gets
puts fff.pos

# .pos moze da podesi i startnu poziciju
fff = File.open("text.txt")
f.pos = 8
puts fff.gets
puts fff.pos



# WRITE FILES

# fileobj.puts = writes data to file
File.open("write.txt", "w") do |w|
  w.puts "This is a test of writing files"
end

# PARAMETRI ZA WRITE: (File.open("asdf", "r"))
# r  - readonly, pointer start of file
# r+ - read and write of existing file, pointer start of file
# w  - write only, create a new file or overwrite old as if new
# w+ - read and write, file.new creates new from scratch
# a  - write (append) pointer EOF, dodaje na kraj fajla
# a+ - write and read append mode, pointer EOF
# b  - binary file mode, required in win, and for nontext files


# APPEND
# Korisno za logove
log = File.new('logfile.txt', 'a')
log.puts Time.now
log.close

# Whereas puts outputs lines of text, you can perform the writing equivalents of getc and
# read with putc and write:
f = File.open("text.txt", "r+")
f.putc "X"
f.close

# This example opens text.txt for reading and writing, and changes the first character of
# the first line to X. Similarly:
f = File.open("text.txt", "r+")
f.write "123456"
f.close



# RENAMING FILES
File.rename("file1.txt", "file2.txt")

# DELETING FILES
# unlink = delete
File.delete("file1.txt")
File.delete("file1.txt", "file2.txt")
File.unlink("file1.txt")


# FILE OPERATIONS

# FILENAMES UNIX WIN
# join se koristi za path i u win i u nix
# stavlja / ili \ izmedju stringova
File.join('full','path', 'here', 'filename.txt')

# FILE SEPARATOR
# File::SEPARATOR = konstanta gde se cuva separator

# Expand path
# ovo ucivata ceo path za prosledjeni fajl
# npr: /home/user/document/test.txt
File.expand_path("test.txt")

# SEEK
# Menja poziciju file pointera
# za razliku od pos on ima vise opcija

# 3 MODA:
# IO::SEEK_CUR = trenutna pozicija pointera
# IO::SEEK_END = pointer na EOF
# IO::SEEK_SET = apsolutna pozicija isto sto i pos = 5

# Pomera pointer od EOF unazad za 5 mesta
# i stavlja X na tu poziciju
seek_file = File.new("test.txt", "r+")
seek_file.seek(-5, IO::SEEK_END)
seek_file.putc "X"
seek_file.close

# Print svaki 5 char
f5 = File.new("test.txt", "r")
while a = f5.getc
  puts a.chr
  f5.seek(5, IO::SEEK_CUR)
end



# FILE MODIFICATION
# Last modified
puts File.mtime("text.txt")

# Pristup dodatnim parametrima
tt = File.mtime("text.txt")
puts tt.hour
puts tt.min
puts tt.sec


# FILE EXISTS
# provera da li postoji fajl
puts "It lives!" if File.exists?("file1.txt")

# FILE SIZE
puts File.size("text.txt")


# EOF
# .eof? = naziv methoda
f = File.new("test.txt", "r")
catch(:end_of_file) do
  loop do
    throw :end_of_file if f.eof?
    puts f.gets
  end
end
f.close




# DIRECTORIES
#


# CHANGE DIR
Dir.chdir("/tmp/test")
# CURRENT DIR
puts Dir.pwd

# LIST OF FILES & DIR
# Dir.entries
puts Dir.entries("/tmp/test").join(' ')

# kao iterator
Dir.foreach("/tmp/test") do |entry|
  puts entry
end

# Short nacin
# vraca array, sa apsolutnom path
Dir["/tmp/test/*"]

# Isto sto i gornje ali platform independet
Dir[File.join(File::SEPARATOR, 'tmp', 'test', '*')]


# CREATING DIR
Dir.mkdir("mynewdir")

# Pravi dir u okviru nekog drugog sa apsolute path
Dir.mkdir("/test/mynewdir")

# TIP:
#
# However, you cannot create directories under directories that don’t yet
# exist themselves. If you want to create an entire structure of directories,
# you must create them one by one from the top down.


# DELETE DIR
# isto sto i:
# Dir.unlink, .rmdir
Dir.delete("testdir")

# FileUtils
# build in library
# ovde objasnjava rm_f
# rm_f = omogucava brisanje rekursivno
require 'fileutils'
# FileUtils.rm_f(testdir)



# TEMP DIRECTORIES
# Path za temp dir u raznim sistemima
require 'tmpdir'
puts Dir.tmpdir # stampa tmp dir patho

# Platform independent temp file creation
require 'tmpdir'
tempfilename = File.join(Dir.tmpdir, "myapp.dat")
tempfile = File.new(tempfilename, "w")
tempfile.puts "This is only temporary"
tempfile.close
File.delete(tempfilename)

# Isto ali uz pomoc library
# on automatski i brise fajl
# nakon zavrsetka upotrebe
require 'tempfile'
f = Tempfile.new('myapp')
f.puts "Hello"
puts f.path
f.close
