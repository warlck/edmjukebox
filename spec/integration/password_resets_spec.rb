require "spec_helper"

describe "Password Reset" do

	it "emails user when requesting new password reset" do
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

	it "does not email invalid user when requesting new password reset" do
		visit login_path
		click_link "password"
		expect(current_path).to eq new_password_reset_path
		fill_in "Email", with: "nobody@bar.com"
		click_button "Reset Password"
		expect(current_path).to eq(root_path)
		expect(page).to have_content "Email sent"
		expect(last_email).to be_nil 
	end


	it "updates the user password when confirmation matches" do
		user = create(:user, :password_reset_token => "new_token", 
			                 :password_reset_sent_at => 1.hour.ago)
		visit edit_password_reset_path(user.password_reset_token)
		fill_in "Password", with: "foobar"
		click_button "Update Password"
	    expect(page).to have_content "Password doesn't match confirmation"
	    fill_in "Password", with: "foobar"
	    fill_in "Password confirmation", with: "foobar"
	    click_button "Update Password"
	    expect(page).to have_content "Password has been reset"
	end

	it "reports when password reset token has expired" do
		user = create(:user, :password_reset_token => "new_token",
			                :password_reset_sent_at => 5.hours.ago)
		visit edit_password_reset_path user.password_reset_token
		fill_in "Password", with: "foobar"
		fill_in "Password confirmation", with: "foobar"
		click_button "Update Password"
		expect(page).to have_content "Password reset token has expired"
		expect(current_path).to eq new_password_reset_path
	end

	it	"raises record not found error when password reset token is invalid" do
		expect { visit edit_password_reset_path("invalid")}.
		to raise_exception(ActiveRecord::RecordNotFound)
	end






	
end