require 'spec_helper'

describe Artist do
  it "is valid with name, channel_title" + 
          " channel_decription, icon_url, url provided " do
  	   artist = create(:artist)
  	   expect(artist).to be_valid
  end

  it "is invalid without name" do
    invalid_without_attribute "name"
  end

  it 'is invalid without channel_decription' do
  	invalid_without_attribute "channel_description"
  end

  it "is invalid without channel_title" do
  	 invalid_without_attribute "channel_title"
  end



  describe "url field" do
  	it "can not be empty" do
  		expect(build(:artist, url: nil)).not_to be_valid
  	end

  	it "accepts valid urls" do 
  		expect(create(:artist, url: "http://www.google.com" )).to be_valid
  	end

  	it "rejects invalid urls" do
  		expect(build(:artist, url: "wwi.boogie-.co")).not_to be_valid
  	end
  end

  describe "icon_url field" do
  	it "can not be empty" do
  		expect(build(:artist, icon_url: nil)).not_to be_valid
  	end

  	it "accepts valid urls" do 
  		expect(create(:artist)).to be_valid
  	end

  	it "rejects invalid urls" do
  		expect(build(:artist, icon_url: "wwi.boogie-.co")).not_to be_valid
  	end
  end


  describe ".create_artist" do
  	  it "is defined as class method" do
  	  	  expect(Artist).to respond_to(:create_artist)
  	  end

  	  it "expects an argument" do
	  	  expect{Artist.create_artist }.to raise_error(ArgumentError)
  	  end


  end


end


def invalid_without_attribute attribute
    expect(build(:artist, attribute => nil)).
  	      to have(1).errors_on(attribute)
end