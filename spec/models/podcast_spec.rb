# -*- encoding : utf-8 -*-
require 'spec_helper'

describe Podcast do
   describe "instance" do
   	 let(:podcast) { create(:podcast) }
   	 subject { podcast}

   	 it { should respond_to :title }
   	 it { should respond_to :guid }
   	 it { should respond_to :duration }
   	 it { should respond_to :published }
   	 it { should respond_to :file_url }
   	 it { should respond_to :summary }
   	 it { should respond_to :artist } 
   end


   it "is invalid without title" do
   	  podcast_invalid_without :title
   end

   it "is invalid without duration" do
   	  podcast_invalid_without :duration
   end

   it "is invalid without guid" do
   	 podcast_invalid_without :guid
   end


   it "is invalid without summary" do
   	  podcast_invalid_without :summary
   end

   
   
   it "has unique guid" do
   	 create(:podcast, guid: "haha")
   	 expect(build(:podcast, guid: "haha")).to have(1).errors_on(:guid)
   end

   it "is invalid without published" do
   	  expect(build(:podcast, published: nil)).to have(2).errors_on(:published)
   end

   it "is invalid if published is not date" do
   	  expect(build(:podcast, published: '23-bla-ha')).to have(2).errors_on(:published)
   end

   
   context "file_url field" do
   	  it "can not be empty" do
   	    expect(build(:podcast, file_url: nil)).to have(2).errors_on(:file_url)
      end

      it "accepts valid file_url" do
      	expect(create(:podcast, file_url: "http://www.google.com")).to be_valid
      end

      it "accepts valid file_url" do
      	expect(build(:podcast, file_url: "ww-.bo-hoo.c")).to be_invalid
      end
   end



   describe "correctly sets and returns" do
   	  it "title" do
          set_and_get_attribute :title, "Episode 10"
   	  end

   	  it "duration" do
   	  	set_and_get_attribute :duration, "1:00:00"
   	  end

   	  it "guid" do
   	  	set_and_get_attribute :guid, "NEWGUID"
   	  end

   	  it "published" do
   	  	date = Date.parse("24 November 2013")
   	  	set_and_get_attribute :published, date
   	  end

   	  it "summary" do
   	  	set_and_get_attribute :summary, "Summary"
   	  end

   	  it "file_url" do
   	  	 set_and_get_attribute :file_url, "http://www.google.com"
   	  end
   end

end


def podcast_invalid_without attribute
	expect(build(:podcast, attribute => nil)).to have(1).errors_on(attribute)
end

def set_and_get_attribute attribute, value
   podcast = create(:podcast, attribute => value)
   expect(podcast[attribute]).to eq value
end