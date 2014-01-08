# -*- encoding : utf-8 -*-
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



feed_addresses = [
	       "http://podcast.djhardwell.com/podcast.xml", 
	       "http://feeds.djpod.com/corstenscountdown",
	       "http://officialaviciipodcast.podtree.com/feed/podcast/", 
	       "http://trashedradiopodcast.libsyn.com/rss", 
	       "http://ericprydz.podtree.com/feed/podcast/", 
	       "http://promodj.com/Andrew-Rayel/podcast.xml", 
	       "http://quintino.podtree.com/feed/podcast/",
	       "http://www.tatw.co.uk/podcast.xml",
	       "http://www.paulvandyk.com/podcast.php",
	       "http://oakenfold.libsyn.com/rss", 
	       "http://podcast.arunamusic.com/ap.xml", 
	       "http://podcast.daftasticradio.com/podcast.xml", 
	       "http://podcast.wandwmusic.nl/podcast.php", 
	       "http://www.protocol-radio.com/podcast/PRRADIO.xml", 
	       "http://feeds.feedburner.com/bingoplayerspodcast/hysteriaradio", 
	       "http://feeds.feedburner.com/tiestos_club_life", 
	       "http://feeds.feedburner.com/MarkusSchulzGlobalDJBroadcast"]


feed_addresses.each do  |address|
	Artist.create_artist address
end