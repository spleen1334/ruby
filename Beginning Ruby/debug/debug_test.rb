# DEBUGING
#
# Sometimes you want to know what each
# variable contains at a certain point within your program’s execution, or you
# might want to force a variable to contain a certain value.

i = 1
j = 0
until i > 1000000
  i *= 2
  j += 1
end
puts "i = #{i}, j = #{j}"

# DEBUGGER PROMPT
# ruby -r debug nameoffile.rb
#
# Komande:
# list - lista linije koda sa kojima radimo
# step - step by step, moguce je u svakom stepu menajti var, raditi provere...
# cont - nastavlja do end, breakpoint ili watch()
# break - postavlja breakpoint na odredjenu liniju koda npr: break 44
# watch - kondicionalni breakpoint npr: watch x > 10
# quit - izadji iz debugera
