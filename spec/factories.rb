# -*- encoding : utf-8 -*-
FactoryGirl.define do 
	factory :artist do 
		name 'Steven Aoki'
		channel_title "Aoki's House"
		channel_description "The best music ever"
		url 'http://www.aoki.com'
		icon_url "http://media2-so.podtree.com/media/itunes_image/aokishouse_podcast.png"
		feed_url "file://#{Dir.pwd}/spec/avicii.rss"
	end

	factory :podcast do 
		title 'Steven Aoki'
		summary "Aoki's House"
		guid "The best music ever"
		published 'http://www.aoki.com'
		file_url "http://media2-so.podtree.com/media/itunes_image/aokishouse_podcast.png"
	end
end
