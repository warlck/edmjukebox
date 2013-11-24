require 'spec_helper'


feature 'View player homepage' do
	scenario 'user sees  title' do
		visit root_path
		expect(page).to have_css 'title', text: 'EDM player'
	end

	scenario 'user sees list of artists' do
		visit root_path
		expect(page).to have_css '[data-list="artists"]'
	end
end