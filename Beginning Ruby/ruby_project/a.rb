puts "Hello from a.rb"

# Primer loadovanja sa logic
$debug_mode = 0
require $debug_mode == 0 ? "normal-classes" : "debug-classes"

# Shortcut za loadovanje vise fajlova
%w{file1 file2 file3 file4}.each { |file| require file }

# Nested inclusions
# Ovo objasnjava povezanost fajlova u require

# NPR:
# a.rb >> require 'b'
# b.rb >> require 'c'
# c.rb >> def example; puts "Hello!";end
# d.rb >> require 'a'; example
#
# Kada iz d pozivamo example on automatski skace kroz sve
# prethodne require a>b>c i ucitava funkciju
