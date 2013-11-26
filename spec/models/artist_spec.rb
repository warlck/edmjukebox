# -*- encoding : utf-8 -*-
require 'spec_helper'

# Without running callbacks
describe Artist do

  before :each do 
    Artist.skip_callback(:create, :after, :add_entries)
  end

  after :each do
    Artist.set_callback(:create, :after, :add_entries)
  end


    describe "instance" do
      let(:artist) { create(:artist)  }

      subject { artist}

      it { should respond_to :name}
      it { should respond_to :channel_title}
      it { should respond_to :channel_description }
      it { should respond_to :icon_url }
      it { should respond_to :url }
      it { should respond_to :feed_url }
      it { should respond_to :podcasts } 

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

          it "creates new artist for valid feed" do
              expect {Artist.create_artist(local_feed_url(true))}.
                                     to change(Artist, :count).by(1)
          end 

         context "with valid feed" do
            let(:artist) {Artist.create_artist(local_feed_url(true)) }

            it "sets correct artist name" do
                expect(artist.name).to eq avicii(:name)
            end

            it "sets correct channel title" do
               expect(artist.channel_title).to eq avicii(:channel_title)
            end

            it "sets corrent channel decription" do
               expect(artist.channel_description).to eq avicii(:channel_description)
            end

            it "sets corrent icon url" do
               expect(artist.icon_url).to eq avicii(:icon_url)
            end

            it "sets corrent  url" do
               expect(artist.url).to eq avicii(:url)
            end

            it "sets corrent feed url" do
               expect(artist.feed_url).to eq local_feed_url(true)
            end          
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

  describe "has_many podcasts association" do

    before :each do 
      @artist = create(:artist)
      @podcast = build(:podcast)
    end

    it "enables creating Podcast" do      
       expect {@artist.podcasts << @podcast}.
                    to change(Podcast, :count).by(1)
    end


    it "returns all related podcasts" do
        @artist.podcasts << @podcast
        expect(@artist.podcasts).to eq [@podcast] 
    end

    it "destroys all related podcasts upon deletion of artist" do
       @artist.podcasts << @podcast
       @artist.destroy
       expect(Podcast.all).to be_empty
    end
  end
end


#with callbacks turned on
describe Artist do
  describe "add_entries callback" do
      it "creates associated podcasts" do
           artist = Artist.create_artist(local_feed_url(true))
           expect(artist.podcasts.size).to eq 2
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


def avicii field
  avicii = {channel_description: "Avicii LE7ELS is the official monthly podcast direct from the studio of Tim Bergling aka Avicii. Featuring exclusive music, interviews, mixes and live reports from Avicii’s shows around the world, this is one Podcast you need to subscribe to! Produced by the NoiseHouse www.thenoisehouse.com.",
            name: "Avicii", channel_title: "AVICII - LEVELS PODCAST",
            icon_url: "http://media2-av.podtree.com/media/itunes_image/AVICII-LEVELS-THUMBNAIL-JUNE-2011.jpg",
            url: "http://officialaviciipodcast.podtree.com" }
  return avicii[field]
end            
