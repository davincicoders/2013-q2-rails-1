# (Uncomment these lines when you implement this challenge)
# puts "Enter CSV filename to load:"
# filename = readline.chomp

file = File.open("180.html", "w")
file.puts "<html>"
file.puts "  <body>"
file.puts "    <table border='1'>"
file.puts "      <tr>"
file.puts "        <th>Date</th>"
file.puts "        <th>Away team</th>"
file.puts "        <th>Away team's score</th>"
file.puts "        <th>Home team</th>"
file.puts "        <th>Home team's score</th>"
file.puts "      </tr>"

# Example <tr> below: change these lines to the scores from the CSV file
file.puts "      <tr>" 
file.puts "        <td>9/9</td>"
file.puts "        <td>Steelers</td>"
file.puts "        <td>19</td>"
file.puts "        <td>Broncos</td>"
file.puts "        <td>31</td>"
file.puts "      </tr>"

file.puts "    </table>"
file.puts "  </body>"
file.puts "</html>"
file.close
