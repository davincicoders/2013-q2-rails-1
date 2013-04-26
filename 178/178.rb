file = File.open("178.html", "w")
file.puts "<html>"
file.puts "  <body>"
file.puts "    <h1>Headline</h1>"
file.puts "    <p>Paragraph text.</p>"
file.puts "  </body>"
file.puts "</html>"
file.close
