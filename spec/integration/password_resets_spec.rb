require "spec_helper"

describe "Password Reset" do

	it "emails user when requesting new password" do
		user = create(:user)
		visit login_path
		click_link "password"
		expect(current_path).to eq new_password_reset_path
		fill_in "Email", with: user.email
		click_button "Reset Password"
		expect(current_path).to eq(root_path)
		expect(page).to have_content "Email sent"
		expect(last_email.to).to include(user.email) 
	end


	

	
end