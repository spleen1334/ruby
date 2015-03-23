text = %q{
Ruby is a great programming language. It is object oriented
and has many groovy features. Some people don't like it, but that's
not our problem! It's easy to learn. It's great. To learn more about Ruby,
visit the official Ruby Web site today.
}

# gsub >> selektuje jedno ili vise praznih polja i zamenjuje ih sa jednim space
# strip >> uklanja whitespace sa pocetka i kraja stringa
# split >> deli u recenice
sentences = text.gsub(/\s+/, ' ').strip.split(/\.|\?|!/)
# Sortijar po duzini recenice
sentences_sorted = sentences.sort_by { |sentence| sentence.length  }

# Koliko iznosi 1/3 recenica
one_third = sentences_sorted.length / 3

# Uprosceni summarize korisnih recenica,
# to su obicno ne predugacke i ne prekratke recenice
# Racuna se da su otprilike 1/3 od texta
# Sortirali smo recenice po duzini sto znaci da je koristan text nalazi
# u sredini senteces_sorted[]
#
# Ovde se pokusava da se isece sredisnja 1/3 []
# slice >> sece [], slice(pocetak, kraj)
ideal_sentences = sentences_sorted.slice(one_third, one_third + 1)

# is are >> uprosceno resenje za selektovanje NOUNS
# =~ >> Matches rxp against aString, returning the offset of the start of the match
# or nil if the match failed.
ideal_sentences = ideal_sentences.select { |sentence| sentence =~ /is|are/  }

# PRIKAZI KORISNE SUMMARIZE RECENICE
puts ideal_sentences.join(". ")
