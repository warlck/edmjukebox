require 'spec_helper'


describe SessionsController do
	describe "POST #create" do
		it "sets remember_me cookie" do
		    @user = create(:user)
			post :create, email: @user.email, password: @user.password, 
			remember_me: 1
			expect(cookies[:auth_token]).not_to be_nil
		end
	end
	
end
