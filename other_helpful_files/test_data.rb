rails generate scaffold Event age_category:string artist:string code:string description:string festival:string festival_id:string genre:string latitude:string longitude:string status:string title:string updated:string url:string venue:string address:string code:string description:string name:string phone:string post_code:string website:string

has_many Performances


rails generate scaffold Performance concession:string end:datetime price:string start:datetime

"performances"=>[

	{"concession"=>7,
	 "end"=>"2016-03-26 16:30:00",
	 "price"=>8,
	 "start"=>"2016-03-26 09:30:00"

	 {"concession"=>7,
	 "end"=>"2016-03-28 16:30:00",
	 "price"=>8,
	 "start"=>"2016-03-28 09:30:00"

	 {"concession"=>7,
	 "end"=>"2016-03-29 16:30:00",
	 "price"=>8,
	 "start"=>"2016-03-29 09:30:00"

	 {"concession"=>7,
	 "end"=>"2016-03-30 16:30:00",
	 "price"=>8,
	 "start"=>"2016-03-30 09:30:00"

	 {"concession"=>7,
	 "end"=>"2016-03-31 16:30:00",
	 "price"=>8,
	 "start"=>"2016-03-31 09:30:00"

	 {"concession"=>7,
	 "end"=>"2016-04-01 16:30:00",
	 "price"=>8,
	 "start"=>"2016-04-01 09:30:00"

	 {"concession"=>7,
	 "end"=>"2016-04-02 16:30:00",
	 "price"=>8,
	 "start"=>"2016-04-02 09:30:00"

	 {"concession"=>7,
	 "end"=>"2016-04-04 16:30:00",
	 "price"=>8,
	 "start"=>"2016-04-04 09:30:00"

	 {"concession"=>7,
	 "end"=>"2016-04-05 16:30:00",
	 "price"=>8,
	 "start"=>"2016-04-05 09:30:00"

	 {"concession"=>7,
	 "end"=>"2016-04-06 16:30:00",
	 "price"=>8,
	 "start"=>"2016-04-06 09:30:00"

	 {"concession"=>7,
	 "end"=>"2016-04-07 16:30:00",
	 "price"=>8,
	 "start"=>"2016-04-07 09:30:00"

	 {"concession"=>7,
	 "end"=>"2016-04-08 16:30:00",
	 "price"=>8,
	 "start"=>"2016-04-08 09:30:00"

	 {"concession"=>7,
	 "end"=>"2016-04-09 16:30:00",
	 "price"=>8,
	 "start"=>"2016-04-09 09:30:00"}
	 ],



{"age_category"=>"All Ages",
 "artist"=>nil,
 "code"=>"565",
 "description"=>"<p>During the Science Festival we transform Edinburgh's City Art Centre into a science playground packed full of workshops,
 shows and interactive events.</p>\n\n<p><strong>How to book</strong></p>\n\n<p>A Day Pass gets you into City Art Centre to explore as many events as you like. The events are a mixture of bookable and drop-in sessions. Pre-booking your Day Pass and a selection of bookable events is strongly advised to avoid queues and disappointment.</p>\n\n<p>You can browse the events at City Art Centre events below. When you're ready to book your tickets you can add a selection of bookable activities to eligible child day passes. Drop-in activities don't need to be reserved and can be enjoyed by all the family throughout the day.</p>\n\n<p>Please note - when attending City Art Centre children must be accompanied by an adult and unfortunately we do not issue tickets to lone adults.</p>\n\n<p>If you would like to discuss large group bookings for City Art Centre please call our Box Office on 0844 557 2686 and they will be happy to help you plan your visit.</p>",
 "festival"=>"Edinburgh International Science Festival",
 "festival_id"=>"science",
 "genre"=>"Activity",
 "latitude"=>55.9515,
 "longitude"=>-3.18448,
 
 "status"=>"active",
 "title"=>"City Art Centre Day Pass",
 "updated"=>"2016-04-10 07:00:20",
 "url"=>"http://api.edinburghfestivalcity.com/events/d0d52276e52b6ad58b969d86477e6837fa800bd5",
 "venue"=>{"address"=>"2 Market Street\nEdinburgh",
 "code"=>"City Art Centre - Our Flagship Family Venue",
 "description"=>nil,
 "name"=>"City Art Centre - Our Flagship Family Venue",
 "phone"=>nil,
 "post_code"=>"EH1 1DE"

 "website"=>"http://www.sciencefestival.co.uk/event-details/city-art-centre-day-pass-"}