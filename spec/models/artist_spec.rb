require 'spec_helper'

describe Artist do
  it "it is valid with name, channel_title" + 
          " channel_decription, icon_url, url provided " do
  	   artist = create(:artist)
  	   expect(artist).to be_valid
  end
end
