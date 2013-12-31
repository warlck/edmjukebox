require 'spec_helper'

	feature	"User viewing subscriptions" do
		let(:user) {create(:user)}
		let(:artist) { create(:artist)}
		before(:each) do
		     user.subscribe_to_artist artist.id 
		     log_in user
		 end
		scenario "can see subscribed artists " do
			visit user_path user
			expect(page).to have_content artist.channel_title
		end

		scenario "switching  artists " , js: true , :slow do
			hardwell = create(:artist, name: 'Hardwell')
			hardwell.podcasts << build(:podcast, title: 'Hardwell on Air')
			user.subscribe_to_artist hardwell.id
			visit user_path user
			find_link("#{hardwell.name}").click
			hardwell.podcasts.each  do |podcast|
				expect(page).to have_content podcast.title
			end

		end
	end