require "socket"

def parse_request(request_line)
  method, path_params, http = request_line.split
  path, params = path_params.split('?')
  params = params.split('&').each_with_object({}) do |pair, hsh|
              key, value = pair.split('=')
              hsh[key] = value
            end

  [method, path, params]
end

server = TCPServer.new("localhost", 3003)
loop do
  client = server.accept

  request_line = client.gets
  next if !request_line || request_line =~ /favicon/
  method, path, params = parse_request(request_line)


  client.puts "HTTP/1.1 200 OK"
  client.puts "Content-Type: text/html\r\n\r\n"
  client.puts "<html>"
  client.puts "<body>"

  rolls = params['rolls'].to_i
  sides = params['sides'].to_i

  client.puts "<h2>You are rolling #{rolls} #{sides} sided di(ce)</h2>"
  roll_count = 0
  total = 0

  while roll_count < rolls
    roll = rand(sides) + 1
    client.puts "<h4>Roll #{roll_count + 1}: #{roll}</h4>"
    total += roll
    roll_count += 1
  end

  client.puts "<h3>Your total is #{total}</h3>"

  client.puts "</body>"
  client.puts "</html>"
  client.close
end
