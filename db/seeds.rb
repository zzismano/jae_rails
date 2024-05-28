

LeisureGenre.destroy_all
LeisureVenue.destroy_all
Genre.destroy_all
Leisure.destroy_all
Venue.destroy_all
Category.destroy_all
User.destroy_all

puts "Creating admin users..."

admin1 = User.new(email: 'carla@jae.com', password: 123456, admin: true)
admin1.save!

admin2 = User.new(email: 'pedro@jae.com', password: 123456, admin: true)
admin2.save!

user = User.new(email: 'user@jae.com', password: 123456)
user.save!

users = [admin1, admin2]

puts "Creating venues..."

cinemark = Venue.new(name: 'Cinemark', address: 'Praia de Botafogo', capacity: 100, website: 'www.cinemark.com.br', user: users.sample)

cinemark.save!

uci = Venue.new(name: 'UCI NYCC', address: 'Avenida das Américas 5000', capacity: 150, website: 'www.uci-nycc.com.br', user: users.sample)

uci.save!

poeira = Venue.new(name: 'Teatro Poeira', address: 'R. São João Batista, 104', capacity: 80, website: 'www.teatropoeira.com.br', user: users.sample)

poeira.save!

puts "Creating category...."

filme = Category.new(name: 'Filme', subcategories: ["Drama", "Horror", "Comedy"], user: users.sample)

filme.save!

teatro = Category.new(name: 'Teatro', subcategories: ["Drama", "Horror", "Comedy"], user: users.sample)

teatro.save!

# puts "Creating leisure..."

leisure = Leisure.new(category: filme, link: 'www.guerracivil.com.br', title: "Guerra Civil", subtitle: 'A Guerra de dois mundos', director: 'Francisco Padilha', country: 'BR', description: 'O fime retrata a guerra de dois mundos e a cobertura jornalistica realizada pela grande mídia', features: 'Wagner Moura', min_age: 16, duration: 2, start_date: '10/05/2024', end_date: '20/06/2024', zone: "Zona Sul/Centro", user: users.sample)

leisure.save!

leisure2 = Leisure.new(category: teatro, link: 'www.teatropoeira.com.br', title: "Sonata de Outono", subtitle: 'Um subtitulo qualquer', director: 'Marieta Severo', country: 'BR', description: 'Uma sonata dedicada à relação de mãe e filho', features: 'Marieta Severo, Andrea Beltrao', min_age: 18, duration: 2, start_date: '10/05/2024', end_date: '20/06/2024', zone: 'Zona Oeste', user: users.sample)

leisure2.save!

puts "Creating genre..."

artsy = Genre.new(name: 'Artsy', user: users.sample)
artsy.save!

cartaz = Genre.new(name: 'Em cartaz', user: users.sample)
cartaz.save!

puts "Creating leisure_genre..."

join_leisure_genre = LeisureGenre.new(leisure: leisure2, genre: artsy)
join_leisure_genre.save!

puts "Creating leisure leisure_venues..."

join_leisure_venue1 = LeisureVenue.new(leisure: leisure, venue: uci)
join_leisure_venue1.save!

join_leisure_venue2 = LeisureVenue.new(leisure: leisure, venue: cinemark)

join_leisure_venue2.save!

puts "Seeding is done!"
