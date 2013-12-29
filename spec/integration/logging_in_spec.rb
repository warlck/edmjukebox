require 'spec_helper'

   feature "User logging in" do
    let(:user) { create(:user)}

      scenario "successfully , when provided valid authentication values" do
        visit root_path
        expect(page).to have_content "Login"
        login_as user.email, user.password
        expect(page).to have_css "div.logged_in"
        expect(page).to have_link "logout"
        expect(page).not_to have_content "Sign Up"
        expect(page).not_to have_content "Login"
      end


      scenario "unsuccessfully , when provided invalid authentication values" do
        login_as user.email, "incorrect"  
        expect(page).to have_css 'div#flash_alert', text: "Email or password is invalid"
      end

      scenario "logs outs successfully" do
        login_as user.email , user.password
        click_link "logout"
        expect(current_path).to eq root_path
        expect(page).to have_link "Login"
        expect(page).to have_link "Sign Up"
      end

    


end
