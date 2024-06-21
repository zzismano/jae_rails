desc "LeisureCleanup is called by the Heroku scheduler add-on"
task :clean_leisures => :environment do
  # today = Date.today.to_s
  puts "apagando eventos expirados..."
  # Leisure.where('end_date < ?', today).destroy_all!
  puts "prontinho!"

end
