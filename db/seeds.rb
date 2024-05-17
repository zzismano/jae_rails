User.destroy_all
Venue.destroy_all
Leisure.destroy_all
Category.destroy_all
Genre.destroy_all

admin1 = User.new(email: 'carla@jae.com', password: 123456, admin: true)
admin1.save!

admin2 = User.new(email: 'pedro@jae.com', password: 123456, admin: true)
admin2.save!

cinemark = Venue.new(name: 'Cinemark', address: 'Praia de Botafogo', capacity: 100, site: 'www.cinemark.com.br')

cinemark.save!

uci = Venue.new(name: 'UCI NYCC', address: 'Avenida das Américas 5000', capacity: 150, website: 'www.uci-nycc.com.br')

uci.save!

filme = Category.new(name: 'Filme', subcategories: ["Drama", "Horror", "Comedy"])

filme.save!

teatro = Category.new(name: 'Teatro', subcategories: ["Drama", "Horror", "Comedy"])

teatro.save!

leisure = Leisure.new(category: filme, venue: uci, link: 'www.guerracivil.com.br', title: "Guerra Civil", subtitle: 'A Guerra de dois mundos', director: 'Francisco Padilha', country: 'USA', description: 'O fime retrata a guerra de dois mundos e a cobertura jornalistica realizada pela grande mídia', features: 'Wagner Moura', min_age: 16, duration: 2, start_date: '10/05/2024', end_date: '20/06/2024')