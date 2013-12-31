require 'spec_helper'

feature	"User  on user show page" do
	let(:user) {create(:user)}
	let(:artist) { create(:artist)}
	before(:each) do user.subscribe_to_artist artist.id 
		             log_in user
		         end

	scenario "playing podcast",  js: true do
		first_podcast = artist.podcasts.first
        visit user_path user
        expect(page).to have_css '.podcast_item'
        find(:xpath, "//li[@data-id='#{first_podcast.id}']").click
        expect(page).to have_css "#artist_name p",
                        text: artist.name
        expect(page).to have_css "#track_title p", 
                        text: first_podcast.title
        expect(page).to have_css "#channel_title p",
                        text: artist.channel_title

	end


	scenario "playing podcast"  do
		last_podcast = artist.podcasts.last
        visit user_path user
        expect(page).to have_css '.podcast_item'
        find(".jp-next").click
        expect(page).to have_css "#artist_name p",
                        text: artist.name
        expect(page).to have_css "#track_title p", 
                        text: last_podcast.title
        expect(page).to have_css "#channel_title p",
                        text: artist.channel_title

	end

end