LeisureGenre.destroy_all
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

puts "Creating venues..."

cinemark = Venue.new(name: 'Cinemark', address: 'Praia de Botafogo', capacity: 100, website: 'www.cinemark.com.br')

cinemark.save!

uci = Venue.new(name: 'UCI NYCC', address: 'Avenida das Américas 5000', capacity: 150, website: 'www.uci-nycc.com.br')

uci.save!

poeira = Venue.new(name: 'Teatro Poeira', address: 'R. São João Batista, 104', capacity: 80, website: 'www.teatropoeira.com.br')

poeira.save!

puts "Creating category...."

filme = Category.new(name: 'Filme', subcategories: ["Drama", "Horror", "Comedy"])

filme.save!

teatro = Category.new(name: 'Teatro', subcategories: ["Drama", "Horror", "Comedy"])

teatro.save!

puts "Creating leisure..."

leisure = Leisure.new(category: filme, venue: uci, link: 'www.guerracivil.com.br', title: "Guerra Civil", subtitle: 'A Guerra de dois mundos', director: 'Francisco Padilha', country: 'USA', description: 'O fime retrata a guerra de dois mundos e a cobertura jornalistica realizada pela grande mídia', features: 'Wagner Moura', min_age: 16, duration: 2, start_date: '10/05/2024', end_date: '20/06/2024')

leisure.save!

leisure2 = Leisure.new(category: teatro, venue: poeira, link: 'www.teatropoeira.com.br', title: "Sonata de Outono", subtitle: '', director: 'Marieta Severo', country: 'BR', description: 'Uma sonata dedicada à relação de mãe e filho', features: 'Marieta Severo, Andrea Beltrao', min_age: 18, duration: 2, start_date: '10/05/2024', end_date: '20/06/2024')

leisure2.save!

puts "Creating genre..."

artsy = Genre.new(name: 'Artsy')
artsy.save!

cartaz = Genre.new(name: 'Em cartaz')
cartaz.save!

puts "Creating leisure_genre..."

join = LeisureGenre.new(leisure: leisure2, genre: artsy)
join.save!

puts "Seeding is done!"