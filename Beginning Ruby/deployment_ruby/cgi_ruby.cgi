# CGI = Common Gateway Interface
# standard koji omogucava serverima (npr apache)
# da pokrecu programe i da salju/primaju podatke od clienta


# BASIC CGI

#!/usr/bin/ruby

puts "Content-type: text/html\n\n"
puts "<html><body>This is a test script</body></html>"

# CGI LIBRARY

#!/usr/bin/ruby
require 'cgi'

cgi = CGI.new

puts cgi.header
puts "<html><body>This is a test script</body></html>"


# CGI RECEIVE
# Uzima vrednosti iz POST
# Ali moze i direktno iz url da se proslede parametri:
# http://www.example.com/test.cgi?text=this+is+a+test.

#!/usr/bin/ruby
require 'cgi'

cgi = CGI.new
text = cgi['text'] # 'text' = ime <input>

puts cgi.header
puts "<html><body>#{text.reverse}</body></html>"