require 'spec_helper'

feature "User viewing the artist show page" do
   let(:artist) {create(:artist)}
   before :each do
   	  visit artist_path(artist)
   end

   scenario "sees sidebar with artist particulars" do

     expect(page).to have_css 'div#artist_sidebar'
     expect(page).to have_css "img[data-image='artist_icon']", src: artist.icon_url
     expect(page).to have_css "a[href='#{artist.url}']", text: 'Website'
     expect(page).to have_css "a", text: "Report a Concern"  

   end


   scenario "seed list of artist's podcasts" do
      expect(page).to have_css 'ul#podcasts'
      expect(page).to have_css 'ul#podcasts li'
   end

end
