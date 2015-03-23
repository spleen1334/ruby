# LIBRARIES
# NET/HTTP = standard library

require 'net/http'

# Podsetnik: Net = module, HTTP= subclass
# get_print = printuje html
Net::HTTP.get_print('www.rubyinside.com', '/')


# Slicno kao i node
url = URI.parse('www.rubyinside.com') # parse razlaze adresu (url.host, url.port...)
# start = napravi HTTP request
response = Net::HTTP.start(url.host, url.port) do |http|
  http.get(url.path) # nakon uspostavljene konekcije posalji GET
end
# response u sebi sadrzi sve elemente tako da je moguce pristupiti samo
# odredjenim (npr body) za razliku od get_print koji uzima ceo html
content = response.body

puts content
