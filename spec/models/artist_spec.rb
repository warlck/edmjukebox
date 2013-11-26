require 'spec_helper'


describe Artist do

  describe "has attribute" do
    let(:artist) { create(:artist)  }

    subject { artist}

    it { should respond_to :name}
    it { should respond_to :channel_title}
    it { should respond_to :channel_description }
    it { should respond_to :icon_url }
    it { should respond_to :url }
    it { should respond_to :feed_url}
    
  end


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

   it "is invalid without feed_url" do
     invalid_without_attribute "feed_url"
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
        
    

      describe "given valid feed_url address" do
          it "creates new aritst for valid feed" do
            expect {Artist.create_artist(local_feed_url(true))}.
                                   to change(Artist, :count).by(1)
          end

          it "does not create new artist for invalid feed" do
             expect {Artist.create_artist(local_feed_url(false))}.
                                   to change(Artist, :count).by(0)
          end
      end

      describe "given invalid feed_url address" do
        it "does not create new aritst" do
               expect {Artist.create_artist("invalid url")}.
                                   to change(Artist, :count).by(0)
        end
    
      end
  end


end


def invalid_without_attribute attribute
    expect(build(:artist, attribute => nil)).
  	      to have(1).errors_on(attribute)
end

def local_feed_url valid
   if valid
      "file://#{Dir.pwd}/spec/avicii.rss"
   else
      "file://#{Dir.pwd}/spec/empty.rss"
   end
end
