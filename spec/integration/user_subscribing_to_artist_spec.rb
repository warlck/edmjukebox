require "spec_helper"

feature "Subscribing to artist" do
    let(:user) { create(:user)}
    let(:artist) {create(:artist)}
    scenario "when not logged in" do
       visit artist_path(artist)
       expect(page).not_to have_button "Subscribe"
    end

    scenario "when logged in" do
    	log_in user
    	visit artist_path(artist)
    	expect(page).to have_button "Subscribe" 
    	click_button "Subscribe"
    	expect(page).to have_content artist.name
    end

end
