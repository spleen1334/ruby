# RPC = Remote Procedure Call
# Omogucava upotrebu delova programa (methods/procedures) nekog
# drugog programa 

# XML-RPC
# Jedan od najpopularnijih rpc protokola
# XML se koristi za messaging a HTTP za transport
# Primer napisan program u PHP ali se pozivaju metode i koriste se u Ruby

require 'xmlrpc/client'

server = XMLRPC::Client.new2("http://www.rubyinside.com/book/xmlrpctest.cgi")
puts server.call("sample.sumAndDifference", 5, 3).inspect

# XML RPC Error handling
require 'xmlrpc/client'

server = XMLRPC::Client.new2("http://www.rubyinside.com/book/xmlrpctest.cgi")

ok, results = server.call2("sample.sumAndDifference", 5, 3)

# Lepa fora sa multiple assignement
# ok, results imaju istu vrednost
# ali se zbog citljivosti samo ok proverava u petlji
if ok
	puts results.inspect
else
	puts results.faultCode
	puts results.faultString
end