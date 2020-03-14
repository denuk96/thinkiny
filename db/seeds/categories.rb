categories = %w[IT Health Education Sport]
categories.each do |category|
  Category.create(title: category) if Category.find_by(title: category).nil?
  puts "Created #{category}"
end
puts 'SEEDED'
