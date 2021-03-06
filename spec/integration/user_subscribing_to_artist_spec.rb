require "spec_helper"

feature "Subscribing to artist" do
    let(:user) { create(:user)}
    let!(:artist) {create(:artist)}
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
        visit artist_path(artist)
        expect(page).not_to have_button "Subscribe"
    end

    scenario "with js enabled when logged in" ,:slow, js: true do 
        user = create(:user)
        log_in user
        visit artist_path(artist)
        click_button "Subscribe"
        expect(page).not_to have_button "Subscribe"
        expect(user.subscribed_to(artist) ).to eq true 
        expect(current_path).to eq(artist_path(artist))
    end



end
