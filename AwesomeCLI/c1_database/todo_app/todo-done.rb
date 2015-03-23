#!usr/bin/env ruby

# TODO APP
# 3. Ucini todo stavku zavrsenom (completed)

task_number = ARGV.shift.to_i

File.open('todo.txt', 'r') do |file|
  File.open('todo.txt.new', 'w') do |new_file|
    counter =1

    file.readlines.each do |line|
      name, created, completed = line.chomp.split(/,/)

      if task_number == counter
        new_file.puts("#{name}, #{created}, #{Time.now}")
        puts "Task #{counter} completed."
      else
        # ne zme da ima zarez kod #completed JER ONDA NIJE VISE NIL
        new_file.puts("#{name}, #{created},#{completed}")
      end

      counter += 1
    end
  end
end

# Bash, overwrituje stari fajl
'mv todo.txt.new todo.txt'
