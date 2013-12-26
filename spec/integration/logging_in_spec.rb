require 'spec_helper'

feature "User logs in" do
	scenario "successfully , when provided valid authentication values" do
		user = create(:user)
        visit root_path
        click_link "Login"
        expect(page).to have_content "Log In"
        fill_in "Email", with: user.email 
        fill_in "Password", with: "foobar"
        click_button "Log In"
        expect(page).to have_css "div.logged_in"
        expect(page).to have_link "logout"
        expect(page).not_to have_content "Sign Up"
        expect(page).not_to have_content "Login"
	end
	scenario "successfully , when provided valid authentication values" do
		user = create(:user)
        visit root_path
        click_link "Login"
        expect(page).to have_content "Log In"
        fill_in "Email", with: user.email 
        fill_in "Password", with: "incorrect"
        click_button "Log In"
        expect(page).to have_css 'div#flash_alert', text: "Email or password is invalid"
	end
end