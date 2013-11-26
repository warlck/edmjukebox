FactoryGirl.define do 
	factory :artist do 
		name 'Steven Aoki'
		channel_title "Aoki's House"
		channel_description "The best music ever"
		url 'http://www.aoki.com'
		icon_url "http://media2-so.podtree.com/media/itunes_image/aokishouse_podcast.png"
		feed_url 'http://www.aoki.com'
	end

	factory :podcast do 
		title 'Steven Aoki'
		summary "Aoki's House"
		guid "The best music ever"
		published 'http://www.aoki.com'
		file_url "http://media2-so.podtree.com/media/itunes_image/aokishouse_podcast.png"
	end
end