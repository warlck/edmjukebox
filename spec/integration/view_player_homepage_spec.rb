require 'spec_helper'


feature 'View player homepage' do
	scenario 'user sees  title' do
		visit root_path
		expect(page).to have_css 'title', text: 'EDM player'
	end

	scenario 'user sees list of artists' do
		Artist.create(name: 'Steven Aoki')
		visit root_path
		expect(page).to have_css '[data-list="artists"]'
		expect(page).to have_css 'li.artist'
	end
end