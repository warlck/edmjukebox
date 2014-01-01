require 'spec_helper'

feature	"User  on user show page" do
	let(:user) {create(:user)}
	let(:artist) { create(:artist)}
	let(:first_podcast) {  artist.podcasts.first }
	let(:last_podcast) { artist.podcasts.last }
	before(:each) do user.subscribe_to_artist artist.id 
		             log_in user 
		         end

	scenario "playing podcast", :slow, js: true do
		
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


end