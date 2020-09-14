# frozen_string_literal: true

Fabricator(:user) do
  email { Faker::Internet.email }
  password { Faker::Name.name }
  username { Faker::Name.name }
end

Fabricator(:venue) do
  address { Faker::Address.street_address }
  box_office_fringe { Faker::Boolean }
  box_office_opening { Faker::Lorem.sentences(3) }
  cafe_description { Faker::Lorem.sentences(3) }
  code { Faker::Number.unique.number(5) }
  email { Faker::Internet.free_email }
  fax { Faker::PhoneNumber.phone_number }
  has_bar { Faker::Boolean }
  has_booking_over_card { Faker::Boolean }
  has_booking_over_phone { Faker::Boolean }
  has_booking_over_web { Faker::Boolean }
  has_cafe { Faker::Boolean }
  name { Faker::LordOfTheRings.location }
  phone { Faker::PhoneNumber }
  lat { Faker::Address.latitude }
  lon { Faker::Address.longitude }
  post_code { Faker::Address.postcode }
  web_address { Faker::Internet.url }
  position { Faker::Lorem.word }
  description { Faker::Lorem.sentences(2) }
  disabled_description { Faker::Lorem.sentences(2) }
end

Fabricator(:event) do
  age_category { Faker::Lorem.sentences(4) }
  artist { Faker::LordOfTheRings.character }
  code { Faker::Number.unique.number(5) }
  description { Faker::Lorem.sentences(5) }
  festival { Faker::LordOfTheRings.location }
  festival_id { Faker::Code.unique }
  genre { Faker::Lorem.sentences(2) }
  latitude { Faker::Address.latitude }
  longitude { Faker::Address.longitude }
  status { Faker::Color.color_name }
  title { Faker::Book.title }
  updated { Faker::Date.between(100.days.ago, Date.today) }
  url { Faker::Internet.url }
  website { Faker::Internet.url }
  score { Faker::Number.number(3) }
  festival_year { Faker::Number.between(2015, 2017) }
  venue
end

Fabricator(:favourite) do
  user
  event
end

Fabricator(:performance) do
  concession { Faker::Lorem.sentences(2) }
  end_time { Faker::Time.between(10.days.ago, Date.today, :evening) }
  price { "£#{Faker::Number.decimal(2)}" }
  start_time { Faker::Time.between(10.days.ago, Date.today, :evening) }
  event
end

Fabricator(:review) do
  url { Faker::Internet.url }
  title { Faker::ChuckNorris.fact }
  event
end

Fabricator(:vote) do
  user
  event
  value { Faker::Boolean ? 1 : 0 }
end
