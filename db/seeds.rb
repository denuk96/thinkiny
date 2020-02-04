if User.find_by(email: 'admin@example.com').nil?
  User.create([email: 'admin@example.com', password: 'Adminpass', password_confirmation: 'Adminpass', admin: true])
else
  puts 'User already exist'
end