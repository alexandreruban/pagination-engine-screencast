puts "Destroying old recordings..."
Recording.destroy_all

puts "Creating recordings..."
110.times { Recording.create! }
