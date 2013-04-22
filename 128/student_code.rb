puts "Enter the password:"
password = readline.chomp

if password.casecmp("dvc") == 0
	puts "Correct"
else
	puts "Incorrect"
end