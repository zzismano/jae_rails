require 'open-uri'
require 'json'
require 'pry-byebug'

LeisureGenre.destroy_all
LeisureVenue.destroy_all
Genre.destroy_all
Leisure.destroy_all
Venue.destroy_all
Category.destroy_all
User.destroy_all
Banner.destroy_all

puts "Creating admin users..."

admin1 = User.new(email: 'carla@jae.com', password: 123456, admin: true)
admin1.save!

admin2 = User.new(email: 'pedro@jae.com', password: 123456, admin: true)
admin2.save!

user = User.new(email: 'user@jae.com', password: 123456)
user.save!

users = [admin1, admin2]

puts "Creating one single banner..."

banner = Banner.new(caption_one: "Mussum Ipsum, cacilds vidis abertis. Pra lá, depois divoltis, paradis.", caption_two: "Nullam a nisl ut ante blandit hendrerit. Aenean sit amet nisi.", caption_three: "Delegadis gente finis, bibendum egestas augue arcu ut est.", caption_four: "Praesent lacinia ultrices consectetur. Sed non ipsum felis.")

# API call to unsplash 

url = "https://api.unsplash.com/photos/random/?client_id=#{ENV['UNSPLASH_API_KEY']}&orientation=landscape&query=nature"

unsplash_api = URI.open(url).read
response = JSON.parse(unsplash_api)
photo_url = response["urls"]["regular"]
file_one = URI.open(photo_url)

puts "Found photo url one"


banner.photo_one.attach(io: file_one, filename: "nature_one.png", content_type: "image/jpg")

puts "Attached photo_one to banner"

unsplash_api2 = URI.open(url).read
response2 = JSON.parse(unsplash_api2)
photo_url2 = response2["urls"]["regular"]
file_two = URI.open(photo_url2)

puts "Found photo url two"

banner.photo_two.attach(io: file_two, filename: "nature_two.png", content_type: "image/jpg")

puts "Attached photo_two to banner"

unsplash_api3 = URI.open(url).read
response3 = JSON.parse(unsplash_api3)
photo_url3 = response3["urls"]["regular"]
file_three = URI.open(photo_url3)

puts "Found photo url three"

banner.photo_three.attach(io: file_three, filename: "nature_three.png", content_type: "image/jpg")

puts "Attached photo_three to banner"

unsplash_api4 = URI.open(url).read
response4 = JSON.parse(unsplash_api4)
photo_url4 = response4["urls"]["regular"]
file_four = URI.open(photo_url4)

puts "Found photo url four"

banner.photo_four.attach(io: file_four, filename: "nature_four.png", content_type: "image/jpg")

puts "Attached photo_four to banner"


banner.save

puts "Saved banner!"

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
