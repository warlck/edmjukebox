module LoginHelpers
	def login_as email, password
		visit login_path
	    fill_in "Email" , with: email
	    fill_in "Password", with: password
	    click_button "Log In"
	end

	def log_in user
		login_as user.email, user.password
	end
end

RSpec.configure do |config|
	config.include LoginHelpers
end