require 'spec_helper'


feature 'User viewing player homepage' do
	let!(:artist) { create(:artist) }
	let!(:artists) { [create(:artist, name: 'Tiesto'),
			       create(:artist, name: 'hardwell')]}
	before :each do
	   visit root_path
	end

	scenario 'sees  title' do
		expect(page).to have_css 'title', text: 'EDM player'
	end

	scenario 'sees list of artists' do
		shows_correct_number_of_artists 3
	end

	scenario 'sees artist details' do
		shows_artist_details artist
	end
		
end



def shows_correct_number_of_artists count
	expect(page).to have_css '[data-list="artists"]'
	expect(page).to have_css 'li.artist', count: count
end

def shows_artist_details artist
	expect(page).to have_css "img[src='#{artist.icon_url}']"
	expect(page).to have_css "p.artist_name", text: "#{artist.name}"
	expect(page).to have_css "p.channel_title", text: "#{artist.channel_title}"
end
