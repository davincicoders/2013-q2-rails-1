require './connect_to_db.rb'

# TODO: List every course in the database, sorted by course_number,
#       with each student enrolled in that course listed underneath, indented.
# For example:
# CS101 Intro to Programming
#   John Smith
#   Deb Miller
# MA202 Calculus
#   Deb Miller

for classes in Course.order("course_number")
  puts "#{classes.course_number} #{classes.name}"
for students in classes.students
  puts "  #{students.full_name}"
  end
end