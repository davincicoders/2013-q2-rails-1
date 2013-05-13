require './connect_to_db.rb'

puts "Enter the course number (e.g. CS101):"
course_num = readline.chomp

# TODO: Look up the course by its number.  If there's no such course, print:
# "No such course." and exit.


# TODO: Look up the student by their number.  If there's no such student, print:
# "No such student." and exit.

# TODO: add that student to that course.

course = Course.where(course_number: course_num).first

if course == nil 
    puts "No such course."
else 
 puts "Enter the student number:"
  student_num = readline.chomp
  student = Student.where(student_number: student_num).first
  if student == nil
    puts "No such student."
  end
end

if course != nil && student != nil
  course.students << student
end