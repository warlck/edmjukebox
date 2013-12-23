
# -*- encoding : utf-8 -*-
require 'spec_helper'


# Without running callbacks
describe Artist , skip: true do

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
      it { should respond_to :url }
      it { should respond_to :feed_url }
      it { should respond_to :podcasts } 
      it { should respond_to :image }

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



    context "url field" do
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


    
      it "accepts valid urls" do 
        expect(create(:artist)).to be_valid
      end

  
 

    

    describe ".create_artist" do
      it "is defined as class method" do
          expect(Artist).to respond_to(:create_artist)
      end

      it "expects an argument" do
        expect{Artist.create_artist }.to raise_error(ArgumentError)
      end
        

      context "given valid feed_url address" do
          it "creates new artist for valid feed" do
              changes_artist_count_by local_feed_url(true), 1
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


            it "sets corrent  url" do
               expect(artist.url).to eq avicii(:url)
            end

            it "sets corrent feed url" do
               expect(artist.feed_url).to eq local_feed_url(true)
            end          
         end
          
          it "does not create new artist for invalid feed" do
             changes_artist_count_by local_feed_url(false), 0 
          end
      end

      context "given invalid feed_url address" do
        it "does not create new aritst" do
               changes_artist_count_by "invalid feed", 0
        end
      end
    end

  describe "has_many podcasts association" do

    before :each do 
      @artist = create(:artist)
      @podcast = build(:podcast)
      @artist.podcasts << @podcast
    end

    it "enables creating Podcast" do      
       expect {@artist.podcasts << create(:podcast, guid: "new guid")}.
                    to change(Podcast, :count).by(1)
    end


    it "returns all related podcasts" do
        expect(@artist.podcasts).to eq [@podcast] 
    end

    it "destroys all related podcasts upon deletion of artist" do
       @artist.destroy
       expect(Podcast.all).to be_empty
    end
  end

  
  describe "image attachment" do
    let(:artist) { create(:artist) }
    subject { artist }

    it { should have_attached_file(:image)}
    #it { should validate_attachment_presence(:image)}
    it {should validate_attachment_content_type(:image).
        allowing('image/png', 'image/jpg', 'image/jpeg', 'image/gif')}
    it { should validate_attachment_size(:image).less_than(5.megabytes) }

    context "styles" do
      it "are defined" do
         expect(artist.image).to respond_to(:url)
      end
    end

    context "uploaded to S3" do
      
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

      it "changes the number of Podcast objects" do
         expect{create(:artist)}.to change(Podcast, :count).by(2)
      end
  end
end


