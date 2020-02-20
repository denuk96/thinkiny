if User.find_by(email: 'admin@example.com').nil?
  User.create([email: 'admin@example.com', password: 'Adminpass', password_confirmation: 'Adminpass', admin: true])
else
  puts 'User already exist'
end

15.times do |n|
  User.create(first_name: "JAMES BOND 00#{n + 1}", email: "email#{n + 1}@mail.com", password: 'password', password_confirmation: 'password')
end

3.times do |n|
  Course.create(name: "title #{n+1}", description: "description", status: 'new', pre_moderation: true, place_quantities: 5)
end

2.times do |n|
  Course.create(name: "title #{n+1}", description: "description", status: 'new', pre_moderation: false, place_quantities: 5)
end

5.times do |n|
  CourseUser.create(user_id: (n + 1), course_id: (n + 1), role: 'organizer', confirmed: false)
  CourseUser.create(user_id: (n + 1), course_id: (n + 1), role: 'participant', confirmed: true)
  CourseUser.create(user_id: (n + 1), course_id: (n + 1), role: 'participant', confirmed: false)
end