require "spec_helper"

feature "creating new user" do
	before(:each) do 
					 visit  root_path
		             click_link "Sign Up"
		          end
	scenario " successfully given valid attributes" do
		expect(page).to have_content "New User Registration"
		fill_in "Email", with: "me@example.com"
		fill_in "Password", with: "foobar"
		fill_in "Password confirmation", with: "foobar"
		click_button "Submit"
		expect(page).to have_content "Successfully Registered"
	end

	scenario "unsuccessfully  given invalid password confirmation" do
		fill_in "Email", with: "me@example.com"
		fill_in "Password", with: "foobar"
		click_button "Submit"
		expect(page).to have_content "Password doesn't match confirmation"
		expect(page).to have_content "New User Registration"
	end

	scenario "unsuccessfully given invalid email" do
		fill_in "Email", with: ""
		fill_in "Password", with: "foobar"
		fill_in "Password confirmation", with: "foobar"
		click_button "Submit"
		expect(page).to have_content "Email can't be blank"
	end

	scenario "unsuccessfully  given empty	password " do
		fill_in "Email", with: "me@example.com"
		fill_in "Password confirmation", with: "foobar"
		click_button "Submit"
		expect(page).to have_content "Password doesn't match confirmation"
		expect(page).to have_content "New User Registration"
	end




end