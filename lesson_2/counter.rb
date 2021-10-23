# Write a small web application that functions as a "counter"
  # display a number on the screen with two links beneath it
  # one link should increase the number and the other should decrease it
  # to keep track of the number it needs to come in with the URL as part of the request
  # therefore we can "craft" the url of the links to increment and decrement
  # the number by passing the correct "new" number in as a query param
  # this is how we can use a URL to simulate state
  # craft URLs to contain the correct information to render the "state"
  # make sure that your links are manipulating the parameters properly

require "socket"

def parse_request(request_line)
  rq_method, path_params, http = request_line.split
  path, params = path_params.split('?')
  params = (params || "").split('&').each_with_object({}) do |pair, hsh|
              key, value = pair.split('=')
              hsh[key] = value
            end

  [rq_method, path, params]
end

server = TCPServer.new("localhost", 3003)
loop do
  client = server.accept

  request_line = client.gets
  next if !request_line || request_line =~ /favicon/
  rq_method, path, params = parse_request(request_line)


  client.puts "HTTP/1.1 200 OK"
  client.puts "Content-Type: text/html\r\n\r\n"
  client.puts "<html>"
  client.puts "<body>"
  client.puts "<pre>"
  client.puts rq_method
  client.puts path
  client.puts params
  client.puts "</pre>"

  client.puts "<h1>Counter</h1>"

  number = params["number"].to_i

  client.puts "<p>The current number is #{number}.</p>"

  client.puts "<a href='?number=#{number + 1}'>Add one</a>"
  client.puts "<a href='?number=#{number - 1}'>Minus one</a>"

  client.puts "</body>"
  client.puts "</html>"
  client.close
end
  