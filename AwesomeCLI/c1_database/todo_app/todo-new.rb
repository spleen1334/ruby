#!usr/bin/env ruby

# TODO APP
# 1. Dodaje task sa trenutnim vremenom u todo.txt (a = append, pointer eof)
#    a > takodje kreira fajl ukoliko ne postoji

new_task = ARGV.shift

File.open('todo.txt', 'a') do |file|
  file.puts "#{new_task}, #{Time.now}"
  puts "Task added."
end
