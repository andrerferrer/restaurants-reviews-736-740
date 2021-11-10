puts "Cleaning database..."
Restaurant.destroy_all

puts "Creating restaurants..."
dishoom = { name: "Dishoom", address: "7 Boundary St, London E2 7JE", stars: 4 }
pizza_east =  { name: "Pizza East", address: "56A Shoreditch High St, London E1 6PQ", stars: 4 }
koln =  { name: "Kebab", address: "Koln", stars: 5 }
munich =  { name: "Augustina BrochSomething", address: "Munich", stars: 5 }

[ dishoom, pizza_east, koln, munich ].each do |attributes|
  restaurant = Restaurant.create!(attributes)
  puts "Created #{restaurant.name}"
end
puts "Finished!"
