#!/usr/bin/env ruby

# Update 1
# Umesto predefinisanih vrednosti sada uzimamo
# input iz CLI arguments

database = ARGV.shift
username = ARGV.shift
password = ARGV.shift
end_of_iter = ARGV.shift # prosledi naziv iteracije za ime fajla


# Definisanje naziva fajla
if end_of_iter.nil?
  backup_file = database + '_' + Time.now.strftime('%Y%m%d')
else
  backup_file = database + '_' + end_of_iter
end

# Ucitaj podatke u mysqldump komandu
mysqldump = "mysqldump -u#{config[:username]} -p#{config[:password]} " + "#{config[:database]}"

# Izdaj komande u terminal
"mysqldump -u#{:username} -p#{:password} " + "#{:database} > #{backup_file}.sql"
"gzip #{backup_file}.sql"


puts "DB backup complete."
