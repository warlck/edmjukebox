# -*- encoding : utf-8 -*-
FactoryGirl.define do 
	factory :artist do 
		name 'Steven Aoki'
		channel_title "Aoki's House"
		channel_description "The best music ever"
		url 'http://www.aoki.com'
		icon_url "http://media2-so.podtree.com/media/itunes_image/aokishouse_podcast.png"
		feed_url "file://#{Rails.root}/spec/avicii.rss"
		image File.new("#{Rails.root}/spec/AVICII-LEVELS-THUMBNAIL-JUNE-2011.jpg",'r')
	end

	factory :podcast do 
		title 'Steven Aoki'
		summary "Aoki's House"
		guid "The best music ever"
		published '21 November 2123'
		file_url "http://media2-so.podtree.com/media/itunes_image/aokishouse_podcast.png"
		duration '1:00:00'
	end
end
