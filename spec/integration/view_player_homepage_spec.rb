# -*- encoding : utf-8 -*-
require 'spec_helper'


feature 'User viewing player homepage' do

  before :each do 
    Artist.skip_callback(:create, :after, :add_entries)
  end

  after :each do
    Artist.set_callback(:create, :after, :add_entries)
  end

  
	let!(:artists) { [create(:artist, name: 'Tiesto'),
			       create(:artist, name: 'hardwell')]}
    let!(:artist) { artists[0] }
	before :each do
	   visit root_path
	end

	scenario 'sees  title' do
		expect(page).to have_css 'title', text: 'EDM player'
	end

	scenario 'sees list of artists' do
		shows_correct_number_of_artists 2
	end

	scenario 'sees artist details' do
		shows_artist_details artist
	end

	scenario "sees link to artist's tracklist page" do
		#save_and_open_page
		expect(page).to have_css "a[href='#{artist_path(artist)}']" 
	end

	scenario "can go to artist's tracklist page" do
		click_link artist.name
		expect(current_path).to eq artist_path(artist)
	end
		
end

def shows_correct_number_of_artists count
	expect(page).to have_css '[data-list="artists"]'
	expect(page).to have_css 'li.artist', count: count
end

def shows_artist_details artist
	expect(page).to have_css "img[src='#{artist.image.url(:thumb)}']"
	expect(page).to have_css "p.artist_name", text: "#{artist.name}"
	expect(page).to have_css "p.channel_title", text: "#{artist.channel_title}"
end
