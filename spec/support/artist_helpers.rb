# -*- encoding : utf-8 -*-
module ArtistHelpers

  def invalid_without_attribute attribute
    expect(build(:artist, attribute => nil)).
          to have(1).errors_on(attribute)
  end

  def local_feed_url valid
     if valid
        "file://#{Dir.pwd}/spec/avicii.rss"
     else
        "file://#{Dir.pwd}/spec/empty.rss"
     end
  end


  def avicii field
    avicii = {channel_description: "Avicii LE7ELS is the official monthly podcast direct from the studio of Tim Bergling aka Avicii. Featuring exclusive music, interviews, mixes and live reports from Avicii’s shows around the world, this is one Podcast you need to subscribe to! Produced by the NoiseHouse www.thenoisehouse.com.",
              name: "Avicii", channel_title: "AVICII - LEVELS PODCAST",
              icon_url: "http://media2-av.podtree.com/media/itunes_image/AVICII-LEVELS-THUMBNAIL-JUNE-2011.jpg",
              url: "http://officialaviciipodcast.podtree.com" }
    return avicii[field]
  end      

  def changes_artist_count_by feed_url, n
    expect {Artist.create_artist(feed_url)}.
    to change(Artist, :count).by(n)     
  end

end

RSpec.configure do |config|
  config.include ArtistHelpers
end
