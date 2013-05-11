require './connect_to_db.rb'

puts "Enter the course number (e.g. CS101):"
course_num = readline.chomp

course = Course.where(course_number: course_num).first
abort("No such course.") if course == nil

puts "Enter the student number:"
student_num = readline.chomp

student = Student.where(student_number: student_num).first
abort("No such student.") if student == nil

course.students << student

