require './connect_to_db.rb'

# TODO: List every course in the database, sorted by course_number,
#       with each student enrolled in that course listed underneath, indented.
# For example:
# CS101 Intro to Programming
#   John Smith
#   Deb Miller
# MA202 Calculus
#   Deb Miller


courses = Course.order("course_number")
for course in courses
  puts "#{course.course_number} #{course.name}"
  for each in course.students
    puts "  #{each.full_name}"
  end
end
    