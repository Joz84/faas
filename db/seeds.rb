
puts 'Destroy all'
Choice.destroy_all
Battle.destroy_all
Activity.destroy_all
Event.destroy_all
User.destroy_all
Batch.destroy_all


puts 'Create batch'

bordeaux = Batch.create(number: "#276", country: "France", city: "Bordeaux", start_at: Date.new(2019,7,01), end_at: Date.new(2019,8,31))
paris = Batch.create(number: "#290", country: "France", city: "Paris", start_at: Date.new(2019,7,01), end_at: Date.new(2019,8,31))
madrid = Batch.create(number: "#279", country: "Espagne", city: "Madrid", start_at: Date.new(2019,7,01), end_at: Date.new(2019,8,31))
bali = Batch.create(number: "#284", country: "Bali", city: "Bali", start_at: Date.new(2019,7,01), end_at: Date.new(2019,8,31))

puts 'Create driver'

User.create(email: "fouss@gmail.com", password:"azerty", first_name: "Edouard", last_name: "Foussier", driver: true, batch_id: paris.id)
User.create(email: "bertrand@gmail.com", password:"azerty", first_name: "Bertrand", last_name: "Bussac", driver: true, batch_id: bordeaux.id)

puts 'Create students'
User.create(email: "toto@gmail.com", password:"azerty", first_name: "Thomas", last_name: "Dupont", driver: false, batch_id: paris.id)
User.create(email: "coco@gmail.com", password:"azerty", first_name: "Corine", last_name: "Biulo", driver: false, batch_id: paris.id)


puts 'Create event'

Event.create(title: "How to deal with SEO ?", content: "SEO - Google Update, SEO it is dead ?", photo: nil, link: "", address: "16 Villa Gaudelet", city: "Paris", country: "France")

puts ' Create activity Team Building'

require 'open-uri'
require 'nokogiri'

city = 'paris'
url = "https://www.tripadvisor.fr/Attractions-g187147-Activities-c56-#{city}"

html_file = open(url).read
html_doc = Nokogiri::HTML(html_file)

activities_url = html_doc.search('.listing_title a').map {|url| 'https://www.tripadvisor.fr' + url.values.first }

activities_url.first(5).each do |activity|
  html_file = open(activity).read
  html_doc = Nokogiri::HTML(html_file)
  puts '-------------------------'

  p title = html_doc.search('#HEADING').text
  p description = html_doc.search('.attractions-attraction-detail-about-card-AttractionDetailAboutCard__section--1_Efg span:first-child').text
  p address = ("#{html_doc.at('.street-address').text} #{html_doc.at('.locality').text}").split(',').first
  p country = ("#{html_doc.at('.street-address').text} #{html_doc.at('.country-name').text}").split(',').last
  p image = html_doc.at('.prw_common_basic_image img').values[1]
  a = Activity.new(name: title, target: "Team Building", address: address, link: activity, country: country, status: 0 )
  # a.remote_photo_url = image
  a.save
  puts '-------------------------'
end


puts 'Create activity Ice Breaker'
a1 = Activity.create(name: "Know your Buddy", target: "Ice Breaker", address: "16 Villa Gaudelet", city: "Paris", country: "France", status: 0)
a2 = Activity.create(name: "Superhero", target: "Ice Breaker", address: "16 Villa Gaudelet", city: "Paris", country: "France", status: 0)


puts 'Create Battle'

b1 = Battle.create(batch_id: paris.id, date: Date.new(2019,7,4), deadline: Date.new(2019,7,3))
b2 = Battle.create(batch_id: paris.id, date: Date.new(2019,7,11), deadline: Date.new(2019,7,10))

b3 = Battle.create(batch_id: paris.id, date: Date.new(2019,7,9), deadline: Date.new(2019,7,8))
b4 = Battle.create(batch_id: paris.id, date: Date.new(2019,7,14), deadline: Date.new(2019,7,13))


puts 'Create Choice'

Choice.create(battle_id: paris.id, activity_id: Activity.second, vote: 3)
Choice.create(battle_id: paris.id, activity_id: Activity.first, vote: 5)


Choice.create(battle_id: paris.id, activity_id: Activity.third, vote: 12)
Choice.create(battle_id: paris.id, activity_id: Activity.all[3], vote: 1)

Choice.create(battle_id: paris.id, activity_id: Activity.all[4], vote: 4)
Choice.create(battle_id: paris.id, activity_id: Activity.all[1], vote: 18)

