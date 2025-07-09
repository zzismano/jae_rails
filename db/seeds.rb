require 'open-uri'
require 'json'

Section.destroy_all
Card.destroy_all
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

cinemark = Venue.new(name: 'Cinemark', address: 'Praia de Botafogo', capacity: 100, website: 'www.cinemark.com.br', zone: "Zona Sul", user: users.sample)

cinemark.save!

uci = Venue.new(name: 'UCI NYCC', address: 'Avenida das Américas 5000', capacity: 150, website: 'www.uci-nycc.com.br', zone: "Zona Oeste", user: users.sample)

uci.save!

poeira = Venue.new(name: 'Teatro Poeira', address: 'R. São João Batista, 104', capacity: 80, website: 'www.teatropoeira.com.br', zone: "Zona Sul", user: users.sample)

poeira.save!

vivo = Venue.new(name: 'Vivo Rio', address: 'Av. Infante Dom Henrique, 104', capacity: 100, website: 'www.vivorio.com.br', zone: "Zona Sul", user: users.sample)

vivo.save!

quinta = Venue.new(name: 'Quinta da Boa Vista', address: 'Parque Quinta da Boa Vista S/N', capacity: 1000, website: 'www.quintadaboavista.com.br', zone: "Zona Norte", user: users.sample)

quinta.save!

rival = Venue.new(name: 'Teatro Rival', address: 'Rua Álvaro Alvim, 33', capacity: 120, website: 'www.teatro-rival.com.br', zone: "Centro", user: users.sample)

rival.save!

ccbb = Venue.new(name: 'Espaço CCBB', address: 'Av. Primeiro de Março, 1', capacity: 300, website: 'www.ccbb.com.br', zone: "Centro", user: users.sample)

ccbb.save!

france_bresil = Venue.new(name: 'Casa França Brasil', address: 'Rua Visconde de Itaboraí, 78', capacity: 160, website: 'www.casafranca-brasil.com.br', zone: "Centro", user: users.sample)

france_bresil.save!

theatro = Venue.new(name: 'Theatro Municipal', address: 'Praça Floriano, S/N', capacity: 450, website: 'www.theatro-municipal-rj.com.br', zone: "Centro", user: users.sample)

theatro.save!

puts "Creating categories...."

filme = Category.new(name: 'Filme', user: users.sample)

filme.save!

teatro = Category.new(name: 'Teatro', user: users.sample)

teatro.save!

musica = Category.new(name: 'Musica', user: users.sample)

musica.save!

danca = Category.new(name: 'Danca', user: users.sample)

danca.save!

evento = Category.new(name: 'Evento', user: users.sample)

evento.save!

festa = Category.new(name: 'Festa', user: users.sample)

festa.save!

expo = Category.new(name: 'Expo', user: users.sample)

expo.save!

visao = Category.new(name: 'Visão', user: users.sample)
visao.save!

puts "Creating leisure..."

leisure = Leisure.new(category: filme, link: 'www.guerracivil.com.br', title: "Guerra Civil", subtitle: 'A Guerra de dois mundos', director: 'Francisco Padilha', country: 'BR', description: 'O fime retrata a guerra de dois mundos e a cobertura jornalistica realizada pela grande mídia lorem ipsum mastuto hello world meu deus tem que escrever uma duzia de coisas', start_date: '13/02/2024', features: 'Wagner Moura', min_age: 16, duration: 2, end_date: '20/06/2024', date: "08/ago", hidden: false, free: false, user: users.sample)


pic = URI.open('https://conteudo.imguol.com.br/c/splash/00/2024/03/21/poster-de-guerra-civil-1711029679742_v2_750x1.jpg.webp')

leisure.photo.attach(io: pic, filename: "guerra_civil.png", content_type: "image/jpg")

leisure.save!


puts "leisure created!"


leisure2 = Leisure.new(category: teatro, link: 'www.teatropoeira.com.br', title: "Sonata de Outono", subtitle: 'Um subtitulo qualquer', director: 'Marieta Severo', country: 'BR', description: 'Uma sonata dedicada à relação de mãe e filho e como suas vidas se entremeiam cheias de maluquices e brigas.', start_date: '13/02/2024', features: 'Marieta Severo, Andrea Beltrao', min_age: 18, duration: 2, date: "27/Jun a 30/Jul", schedule: "ter e qui 20h | sab e dom 19h", end_date: '20/06/2024', hidden: false , free: false, user: users.sample)

pic2 = URI.open('https://br.web.img2.acsta.net/c_310_420/medias/nmedia/18/90/65/22/20106956.jpg')

leisure2.photo.attach(io: pic2, filename: "sonata_outono.png", content_type: "image/jpg")

leisure2.save!

puts "leisure 2 created!"

leisure3 = Leisure.new(category: musica, link: 'www.babydobrasil.com.br', title: "Baby Do Brasil", subtitle: 'In Concert', country:'BR', description: 'Baby apresenta seus grandes hits, como “Telúrica”, “Sem pecado e sem juízo”, “Planeta Vênus”, “Cósmica”, “Seus olhos”, “Masculino e Feminino”, entre outros. Também vai ter homenagens aos amigos e parceiros com músicas como Baby, Malandro e Brasileirinho.', start_date: '13/02/2024', end_date: '13/08/2024', date: "3/Jul", schedule: "Qua, 20h", hidden: false, free: false, user: users.sample)

pic3 = URI.open('https://eventicket.s3-sa-east-1.amazonaws.com/imgs/28906-img-programacao.jpg')

leisure3.photo.attach(io: pic3, filename: "sonata_outono.png", content_type: "image/jpg")

leisure3.save!

puts "leisure 3 created!"


ziraldo = Leisure.new(category: expo, link: 'www.ccbb.com.br', title: "Ziraldo - 50 anos de cartoon", subtitle: 'Vida e trajetória do cartunista Ziraldo', director: 'Fulano', country: 'BR', description: 'A exposição no CCBB traz um repertório das obras do Ziraldo e traz uma mostra iterativa focada em crianças de 4 a 9 anos.', start_date: '06/07/2024', features: 'Wagner Moura', min_age: 16, duration: 2, end_date: '20/06/2024', date: "08/ago", hidden: false, free: true, user: User.first)

pic4 = URI.open('https://ccbb.com.br/wp-content/uploads/2022/11/Img-13.jpg')
  
ziraldo.photo.attach(io: pic4, filename: "ziraldo.png", content_type: "image/jpg")
  
ziraldo.save!
  
puts "leisure 4 created!"



rara = Leisure.new(category: festa, link: 'www.festa-rara.com.br', title: "Festa Rara", subtitle: 'Disco Raro', director: 'Fulano', country: 'BR', description: 'Os produtores da Rara trazem mais uma edição da festa alternativa/glamour. Sediada na Casa Maison Brasil França, os Djs prometem agitar a noite.', start_date: '27/07/2024', features: 'Dj Elisa Amaral', min_age: 18, duration: 2, end_date: '28/07/2024', date: "27/ago", hidden: false, free: false, user: User.second)

pic5 = URI.open('https://www.revistalounge.com.br/wp-content/uploads/2018/10/%C3%9Altima-edi%C3%A7%C3%A3o-da-festa-RARA-Foto-Mark-Farina.jpg')

rara.photo.attach(io: pic5, filename: "rara.png", content_type: "image/jpg")

rara.save!

puts "leisure 5 created!"

junina = Leisure.new(category: evento, link: 'www.junina.com.br', title: "Junina na Quinta", subtitle: 'Festa Junina na Quinta da Boa Vista', director: 'Prefeitura do RJ', country: 'BR', description: 'A Quinta da Boa Vista se prepara para receber a sua edição da Festa Junina neste fim de semana. O evento contará com barraquinhas de comida, brincadeiras, fogueira e show de forró.', start_date: '27/08/2024', features: 'Trio Pé de Serra', min_age: 12, duration: 2, end_date: '28/08/2024', date: "27/ago", hidden: false, free: true, user: User.first)

  pic6 = URI.open('https://static.itdg.com.br/images/622-auto/9710fa5ed78fff9d9cc974a861d2cc66/quando-e-a-festa-junina.jpg')

  junina.photo.attach(io: pic6, filename: "junina.png", content_type: "image/jpg")
  
  junina.save!
  
  puts "leisure 6 created!"

cisnes = Leisure.new(category: danca, link: 'www.theatro-municipal.com.br', title: "O Lago dos Cisnes", subtitle: '50 anos de Tchaikovsky', director: 'Ana Botafogo', country: 'BR', description: 'O Theatro Municipal do Rio de Janeiro abre suas portas para receber uma nova apresentação do clássico do balé. Corram por que os ingressos voam.', start_date: '27/08/2024', features: 'Ana Botafogo', min_age: 12, duration: 2, end_date: '28/08/2024', date: "27/ago", hidden: false, free: false, user: User.first)

  pic7 = URI.open('https://static.itdg.com.br/images/622-auto/9710fa5ed78fff9d9cc974a861d2cc66/quando-e-a-festa-junina.jpg')

  cisnes.photo.attach(io: pic7, filename: "cisnes.png", content_type: "image/jpg")
  
  cisnes.save!
  
  puts "leisure 7 created!"

# VISÃO LEISURES
visao_leisure1 = Leisure.new(category: visao, link: 'www.visao1.com.br', title: "Exposição Visão 1", subtitle: 'Olhares do Futuro', director: 'Curador 1', country: 'BR', description: 'Uma exposição sobre o futuro da arte e tecnologia.', start_date: '01/09/2024', features: 'Artista A', min_age: 10, duration: 1, end_date: '10/09/2024', date: "01/set", hidden: false, free: true, user: users.sample)
img1 = URI.open('https://images.unsplash.com/photo-1464983953574-0892a716854b')
visao_leisure1.photo.attach(io: img1, filename: "visao1.png", content_type: "image/jpg")
visao_leisure1.save!

visao_leisure2 = Leisure.new(category: visao, link: 'www.visao2.com.br', title: "Exposição Visão 2", subtitle: 'Visões Urbanas', director: 'Curador 2', country: 'BR', description: 'Fotografias e instalações sobre a cidade contemporânea.', start_date: '15/09/2024', features: 'Artista B', min_age: 12, duration: 2, end_date: '25/09/2024', date: "15/set", hidden: false, free: false, user: users.sample)
img2 = URI.open('https://images.unsplash.com/photo-1506744038136-46273834b3fb')
visao_leisure2.photo.attach(io: img2, filename: "visao2.png", content_type: "image/jpg")
visao_leisure2.save!

visao_leisure3 = Leisure.new(category: visao, link: 'www.visao3.com.br', title: "Exposição Visão 3", subtitle: 'Natureza e Olhar', director: 'Curador 3', country: 'BR', description: 'A relação entre natureza e percepção humana.', start_date: '20/10/2024', features: 'Artista C', min_age: 8, duration: 1, end_date: '30/10/2024', date: "20/out", hidden: false, free: true, user: users.sample)
img3 = URI.open('https://images.unsplash.com/photo-1519125323398-675f0ddb6308')
visao_leisure3.photo.attach(io: img3, filename: "visao3.png", content_type: "image/jpg")
visao_leisure3.save!

visao_leisure4 = Leisure.new(category: visao, link: 'www.visao4.com.br', title: "Exposição Visão 4", subtitle: 'Luz e Sombra', director: 'Curador 4', country: 'BR', description: 'Instalações interativas sobre luz e sombra.', start_date: '05/11/2024', features: 'Artista D', min_age: 14, duration: 2, end_date: '15/11/2024', date: "05/nov", hidden: false, free: false, user: users.sample)
img4 = URI.open('https://images.unsplash.com/photo-1465101046530-73398c7f28ca')
visao_leisure4.photo.attach(io: img4, filename: "visao4.png", content_type: "image/jpg")
visao_leisure4.save!

puts "4 leisures Visão criados!"

puts "Creating genre..."

comedia = Genre.new(name: 'Comédia', user: users.sample)
comedia.save!

drama = Genre.new(name: 'Drama', user: users.sample)
drama.save!

terror = Genre.new(name: 'Terror', user: users.sample)
terror.save!

puts "Creating leisure_genre..."

join_leisure_genre = LeisureGenre.new(leisure: leisure2, genre: comedia)
join_leisure_genre.save!

puts "Creating leisure leisure_venues..."

join_leisure_venue1 = LeisureVenue.new(leisure: leisure, venue: uci)
join_leisure_venue1.save!

join_leisure_venue2 = LeisureVenue.new(leisure: leisure, venue: cinemark)

join_leisure_venue2.save!

join_leisure_venue3 = LeisureVenue.new(leisure: leisure2, venue: poeira)

join_leisure_venue3.save!

join_leisure_venue4 = LeisureVenue.new(leisure: leisure3, venue: vivo)

join_leisure_venue4.save!

join_leisure_venue5 = LeisureVenue.new(leisure: cisnes, venue: theatro)

join_leisure_venue5.save!

join_leisure_venue6 = LeisureVenue.new(leisure: rara, venue: france_bresil)

join_leisure_venue6.save!

join_leisure_venue7 = LeisureVenue.new(leisure: junina, venue: quinta)

join_leisure_venue7.save!

join_leisure_venue8 = LeisureVenue.new(leisure: ziraldo, venue: ccbb)

join_leisure_venue8.save!

join_leisure_venue9 = LeisureVenue.new(leisure: visao_leisure1, venue: ccbb)
join_leisure_venue9.save!

join_leisure_venue10 = LeisureVenue.new(leisure: visao_leisure2, venue: ccbb)
join_leisure_venue10.save!

join_leisure_venue11 = LeisureVenue.new(leisure: visao_leisure3, venue: ccbb)
join_leisure_venue11.save!

join_leisure_venue12 = LeisureVenue.new(leisure: visao_leisure4, venue: ccbb)
join_leisure_venue12.save!

puts "Creating Card..."

card = Card.new(leisure: leisure)

card.save!

puts "Seeding is done!"


