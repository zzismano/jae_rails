desc "LeisureCleanup is called by the Heroku scheduler add-on"
task :clean_leisures => :environment do
  today = Date.today
  
  puts "ocultando eventos com hide_date expirado..."
  hidden_count = Leisure.where('hide_date <= ? AND hidden = ?', today, false).update_all(hidden: true)
  puts "ocultados #{hidden_count} eventos"
  
  puts "apagando eventos com end_date expirado..."
  deleted_count = Leisure.where('end_date <= ?', today).count
  Leisure.where('end_date <= ?', today).destroy_all
  puts "deletados #{deleted_count} eventos"
  
  puts "prontinho!"
end
