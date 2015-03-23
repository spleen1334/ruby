#!usr/bin/env ruby

# TODO APP
# 2. Izlistava sve todo stavke


File.open('todo.txt', 'r') do |file|
  # counte koristimo da izbrojimo todo iteme
  counter = 1

  # Ovo je moglo i bez 2struke petlje
  file.readlines.each do |line|

    # lep primer multiple assignement
    # uzima celu liniju iz txt i rasporedjuje rezultat redom na
    # name,created, completed..
    # chomp = uklanja new line(\n)
    # split = deli rezultat chompa u array
    name, created, completed = line.chomp.split(/,/) # , je tacka razdvajanja

    # http://alvinalexander.com/programming/printf-format-cheat-sheet
    #
    # Ovo je slicno kao u BASH ASSIGNEMENT: (Poteklo je iz perl)
    # %3d = trocifreni broj iz counter (prvi parametar)
    # %s = string iz name (drugi parametar)
    printf("%3d - %s\n", counter, name)
    printf("       Created :  %s\n", created)

    unless completed.nil?
      printf("       Completed :  %s\n", completed)
    end

    counter += 1
  end
end
