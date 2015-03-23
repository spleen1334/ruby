# WEBrick
# Library koji dolazi za ruby

# PRIMER
# GENERIC SERVER
# 1. pokrece server na portu 1234
# 2. INT = gasi server ukoliko je proces prekinut (npr ctrl+c)
# 3. za svaku konekciju salje/stampa trenutno vreme
require 'webrick'

server = WEBrick::GenericServer.new( :Port => 1234 )

trap("INT"){ server.shutdown }

server.start do |socket|
	socket.puts Time.now
end


# PRIMER 2
# HTTPSERVER
# Servlet = posebna klasa, i omogucavaju vise kontrole (req, response)
require 'webrick'

class MyServlet < WEBrick::HTTPServlet::AbstractServlet
	def do_GET(request, response)
		response.status = 200
		response.content_type = "text/plain"
		# response.body = "Hello, world!"
		response.body = "You are trying to load #{request.path}"
	end
end

# Tip servera, route / > MyServlet
server = WEBrick::HTTPServer.new( :Port => 1234 )
server.mount "/", MyServlet
trap("INT"){ server.shutdown }
server.start


# PRIMER 3
# Razradjeniji, sa raznim route
require 'webrick'

class MyNormalClass
	def MyNormalClass.add(a, b)
		a.to_i + b.to_i
	end

	def MyNormalClass.subtract(a,b)
		a.to_i - b.to_i
	end
end

class MyServlet < WEBrick::HTTPServlet::AbstractServlet
	def do_GET(request, response)
		if request.query['a'] && request.query['b']
			a = request.query['a']
			b = request.query['b']

			response.status = 200
			response.content_type = 'text/plain'
			result = nil

			case request.path
				when '/add'
					# localhost:1234/add?a=10&b=20
					result = MyNormalClass.add(a,b)
				when '/subtract'
					result = MyNormalClass.subtract(a,b)
				else
					result = "No such method"
			end

			response.body = result.to_s + "\n"

			else
				response.status = 400
				response.body = "You did not provide the correct parameters"
		end
	end
end

server = WEBrick::HTTPServer.new(:Port => 1234)
server.mount '/', MyServlet
trap('INT'){ server.shutdown }
server.start